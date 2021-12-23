import 'package:flutter_clone_small_parts/src/examples/challengers_tabBar_slider_custromScrollView/challengers.dart';
import 'package:flutter_clone_small_parts/src/examples/whats_app_bottom_navigation_bar/whats_app.dart';
import 'package:flutter_clone_small_parts/src/layouts/list_view_layout.dart';
import 'package:flutter_clone_small_parts/src/models/list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListViewLayout(
      items: [
        ListViewItem(
          name: "WhatsApp BottomNavigationBar",
          page: WhatsApp(),
        ),
        ListViewItem(
          name: "Challengers Challenges TabBar and Carousel Slider",
          page: Challengers(),
        ),
      ],
    );
  }
}
