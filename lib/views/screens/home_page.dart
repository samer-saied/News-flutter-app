import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:news_app/controller/homepage_controller.dart';
import 'package:news_app/views/screens/single_page.dart';

import '../widgets/loading_widget.dart';
import '../widgets/main_news_card.dart';
import '../widgets/news_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.controller});

  final HomePageController controller;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();

  int currentPage = 1;
  int total = 1000;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (currentPage != total) {
          currentPage += 1;
          await widget.controller.getMoreCurrentNews(currentPage);
        }
      }
    });

    return widget.controller.isLoading.value
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Center(
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: RefreshIndicator(
                  onRefresh: () {
                    return Future.delayed(const Duration(seconds: 0), () {
                      widget.controller.getCurrentNews();
                      currentPage = 1;
                    });
                  },
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: GetX<HomePageController>(builder: (controller) {
                      return ListView.builder(
                          controller: _scrollController,
                          physics: const BouncingScrollPhysics(),
                          itemCount: widget.controller.currentNews.length + 1,
                          itemBuilder: ((context, index) {
                            if (index == 0) {
                              return GestureDetector(
                                onTap: (() => Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => SinglePage(
                                            newsLink: widget.controller
                                                .currentNews[index].link),
                                      ),
                                    )),
                                child: MainNewsCard(
                                  newsModel:
                                      widget.controller.currentNews[index],
                                ),
                              );
                            } else if (index ==
                                widget.controller.currentNews.length) {
                              return const LoadingCardWidget();
                            } else {
                              return GestureDetector(
                                onTap: (() {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => SinglePage(
                                          newsLink: widget.controller
                                              .currentNews[index].link),
                                    ),
                                  );
                                }),
                                child: NewsCardWidget(
                                  newsModel:
                                      widget.controller.currentNews[index],
                                ),
                              );
                            }
                          }));
                    }),
                  ),
                )),
          );
    // ),}
  }
}
