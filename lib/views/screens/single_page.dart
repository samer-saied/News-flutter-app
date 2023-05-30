import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/singlepage_controller.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/media_widget.dart';

class SinglePage extends StatefulWidget {
  const SinglePage({super.key, required this.newsLink});

  final String newsLink;

  @override
  State<SinglePage> createState() => _SinglePageState();
}

class _SinglePageState extends State<SinglePage> {
  late SinglePageController singlePageController;

  @override
  Widget build(BuildContext context) {
    singlePageController = Get.put(SinglePageController());
    singlePageController.getSingleNews(widget.newsLink);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("AccuNews"),
      ),
      body: GetX<SinglePageController>(
        builder: (controller) => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            controller.singleNews.title,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 4,
                            child: controller.singleNews.type == "image"
                                ? ImageWidget(
                                    imageUrl: controller.singleNews.media)
                                : VideoPlayerWidget(
                                    newsDetailsModel: controller.singleNews)),
                        Text(controller.singleNews.description),
                      ],
                    ),
                  ),
                ),
              ),
      ),
      // ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
