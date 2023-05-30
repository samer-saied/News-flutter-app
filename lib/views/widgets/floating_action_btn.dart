import 'package:flutter/material.dart';

import '../../controller/homepage_controller.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    Key? key,
    required this.homePageController,
  }) : super(key: key);

  final HomePageController homePageController;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => homePageController.getCurrentNews(),
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
