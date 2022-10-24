import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  late Future<int> counter;
  bool isDark = false;

  changeTheme() {
    if (isDark == false) {
      isDark = !isDark;
      Get.changeTheme(ThemeData.dark());
    } else if (isDark == true) {
      isDark = !isDark;
      Get.changeTheme(ThemeData.light());
    }
  }

  Future<void> increment() async {
    final SharedPreferences prefs = await _prefs;
    final int _counter = (prefs.getInt('counter') ?? 0) + 1;
    counter = prefs.setInt('counter', _counter).then((value) => _counter);
    update();
  }

  Future<void> decrement() async {
    final SharedPreferences prefs = await _prefs;
    final int _counter = (prefs.getInt('counter') ?? 0) - 1;
    counter = prefs.setInt('counter', _counter).then((value) => _counter);
    update();
  }

  Future<void> reset() async {
    final SharedPreferences prefs = await _prefs;
    int _counter = (prefs.getInt('counter') ?? 0);
    _counter = 0;
    counter = prefs.setInt('counter', _counter).then((value) => _counter);
    update();
  }

  @override
  void onInit() {
    counter = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('counter') ?? 0;
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
