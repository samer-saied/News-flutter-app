import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/views/screens/main_page.dart';

import 'utils/convert_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AccuNews',
      theme: ThemeData(
        fontFamily: "Cairo",
        primarySwatch: CustomMaterialColor(0, 0, 0).mdColor,
      ),
      home: const MainPage(title: 'AccuNews'),
    );
  }
}
