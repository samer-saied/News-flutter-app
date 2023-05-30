import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/homepage_controller.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  HomePageController homePageController = Get.find<HomePageController>()
    ..getCategories();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(5),
        height: size.height - (kBottomNavigationBarHeight),
        width: size.width,
        child: GetX<HomePageController>(
          builder: (controller) {
            return controller.categories.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: controller.categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      String editedCategory = controller.categories[index]
                          .replaceAll("-", "\n")
                          .toUpperCase();
                      String cat = editedCategory.contains("/")
                          ? editedCategory.split("/")[1]
                          : editedCategory;
                      return Card(
                        color: Colors.black.withOpacity(0.9),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Icon(Icons.sports_soccer),
                            Text(
                              cat,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    });
          },
        ),
      ),
    );
  }
}
