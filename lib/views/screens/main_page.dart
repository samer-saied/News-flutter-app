import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:news_app/controller/homepage_controller.dart';
import 'package:news_app/views/screens/category_page.dart';
import 'package:news_app/views/screens/home_page.dart';

import '../widgets/bottom_nav_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final HomePageController homePageController = Get.put(HomePageController())
    ..getCurrentNews();

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: GestureDetector(
            onTap: () {
              var scrollController = PrimaryScrollController.of(context);
              scrollController.animateTo(
                  scrollController.position.minScrollExtent,
                  duration: const Duration(seconds: 2),
                  curve: Curves.ease);
            },
            child: Text(widget.title)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.list, color: Colors.amber, size: 30),
          onPressed: () => scaffoldKey.currentState?.openDrawer(),
        ),
      ),
      body: GetX<HomePageController>(
        builder: (controller) {
          switch (controller.currentPageIndex.value) {
            case 0:
              return controller.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : MyHomePage(
                      controller: controller,
                    );
            // ),
            case 1:
              return const CategoryPage();
            default:
              return const Text("data");
          }
        },
      ),
      drawer: Drawer(
        semanticLabel: "navigation Menu",
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
