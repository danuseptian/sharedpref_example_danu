import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharedpref_danu/theme.dart';

import 'home/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
