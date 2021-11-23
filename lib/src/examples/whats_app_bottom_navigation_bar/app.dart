import 'package:fluter_clone_small_parts/src/examples/whats_app_bottom_navigation_bar/controller/app_controller.dart';
import 'package:fluter_clone_small_parts/src/examples/whats_app_bottom_navigation_bar/pages/calls.dart';
import 'package:fluter_clone_small_parts/src/examples/whats_app_bottom_navigation_bar/pages/camera.dart';
import 'package:fluter_clone_small_parts/src/examples/whats_app_bottom_navigation_bar/pages/chats.dart';
import 'package:fluter_clone_small_parts/src/examples/whats_app_bottom_navigation_bar/pages/settings.dart';
import 'package:fluter_clone_small_parts/src/examples/whats_app_bottom_navigation_bar/pages/status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends GetView<AppController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // It would be better to call Get.put(AppController()) in separate bindings file
    // using initialBinding argument in main.dart
    Get.put(AppController());

    return Scaffold(
      body: Obx(() {
        switch (RouteName.values[controller.currentIndex.value]) {
          case RouteName.STATUS:
            return Status();
          case RouteName.CALLS:
            return Calls();
          case RouteName.CAMERA:
            return Camera();
          case RouteName.CHATS:
            return Chats();
          case RouteName.SETTINGS:
            return Settings();
        }
      }),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey,
              width: 0.3,
            ),
          ),
        ),
        child: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.currentIndex.value,
            showSelectedLabels: true,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            onTap: controller.changePageIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.online_prediction),
                activeIcon: Icon(Icons.online_prediction, color: Colors.blue),
                label: 'Status',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.phone_outlined),
                activeIcon: Icon(Icons.phone, color: Colors.blue),
                label: 'Calls',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.photo_camera_outlined),
                activeIcon: Icon(Icons.photo_camera, color: Colors.blue),
                label: 'Camera',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline_rounded),
                activeIcon: Icon(Icons.chat_bubble_rounded, color: Colors.blue),
                label: 'Chats',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined),
                activeIcon: Icon(Icons.settings, color: Colors.blue),
                label: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}