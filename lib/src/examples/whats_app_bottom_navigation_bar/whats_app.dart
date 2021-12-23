import 'package:flutter_clone_small_parts/src/examples/whats_app_bottom_navigation_bar/controller/whats_app_controller.dart';
import 'package:flutter_clone_small_parts/src/examples/whats_app_bottom_navigation_bar/pages/calls.dart';
import 'package:flutter_clone_small_parts/src/examples/whats_app_bottom_navigation_bar/pages/camera.dart';
import 'package:flutter_clone_small_parts/src/examples/whats_app_bottom_navigation_bar/pages/chats.dart';
import 'package:flutter_clone_small_parts/src/examples/whats_app_bottom_navigation_bar/pages/settings.dart';
import 'package:flutter_clone_small_parts/src/examples/whats_app_bottom_navigation_bar/pages/status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WhatsApp extends GetView<WhatsAppController> {
  const WhatsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // It would be better to call Get.put(WhatsAppController()) in separate bindings file
    // using initialBinding argument in main.dart
    Get.put(WhatsAppController());

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
            selectedFontSize: 12.0,
            unselectedFontSize: 12.0,
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
