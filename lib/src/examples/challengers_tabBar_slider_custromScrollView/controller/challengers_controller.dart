import 'package:flutter/material.dart';
import 'package:flutter_clone_small_parts/src/examples/challengers_tabBar_slider_custromScrollView/utils/tab_list.dart';
import 'package:get/get.dart';

class ChallengersController extends GetxController
    with SingleGetTickerProviderMixin {
  late TabController tabBarController;
  final List<Tab> challengersTabs = TabList.challengersTabs;

  @override
  void onInit() {
    tabBarController = TabController(
      vsync: this,
      length: challengersTabs.length,
    );

    super.onInit();
  }

  @override
  void onClose() {
    tabBarController.dispose();
    super.onClose();
  }
}
