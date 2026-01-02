import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_reminder/ui/views/duas/duas_view.dart';
import 'package:islamic_reminder/ui/views/home/home_view.dart';
import 'package:islamic_reminder/ui/views/namaz/namaz_view.dart';
import 'package:islamic_reminder/ui/views/settings/settings_view.dart';

class BottombarController extends GetxController {
  var currentIndex = 0.obs;

  final List<Widget> screens = [
    const HomeView(),
    const DuasView(),
    const NamazView(),
    const SettingsView(),
  ];

  void handleNavigation(int index) {
    currentIndex.value = index;
  }
}