import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/homepage_controller.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final HomePageController homePageController =
        Get.find<HomePageController>();

    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.watch_later),
          label: 'Latest',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          label: 'Category',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: homePageController.currentPageIndex.value,
      backgroundColor: Colors.black,
      selectedItemColor: Colors.amber,
      unselectedItemColor: Colors.grey,
      onTap: (i) {
        setState(() {
          homePageController.currentPageIndex.value = i;
        });
      },
    );
  }
}
