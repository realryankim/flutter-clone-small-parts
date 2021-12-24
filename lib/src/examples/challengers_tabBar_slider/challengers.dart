import 'package:flutter/material.dart';
import 'package:flutter_clone_small_parts/src/examples/challengers_tabBar_slider/controller/challengers_controller.dart';
import 'package:flutter_clone_small_parts/src/examples/challengers_tabBar_slider/pages/home.dart';
import 'package:flutter_clone_small_parts/src/examples/challengers_tabBar_slider/pages/new_challenge_page.dart';
import 'package:flutter_clone_small_parts/src/examples/challengers_tabBar_slider/pages/popular_challenge_page.dart';
import 'package:flutter_clone_small_parts/src/examples/challengers_tabBar_slider/pages/recommended_challenge_page.dart';
import 'package:get/get.dart';

class Challengers extends GetView<ChallengersController> {
  const Challengers({Key? key}) : super(key: key);

  Widget _buildActionsButton({Function()? onPressed, required IconData icon}) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.black),
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.put(ChallengersController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text('도전자들', style: TextStyle(color: Colors.black)),
        actions: [
          _buildActionsButton(onPressed: () {}, icon: Icons.search),
          _buildActionsButton(onPressed: () {}, icon: Icons.bookmark_outline),
          _buildActionsButton(
              onPressed: () {}, icon: Icons.shopping_bag_outlined),
        ],
        elevation: 0.4,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              controller: controller.tabBarController,
              padding: EdgeInsets.only(left: 10.0),
              labelColor: Colors.red,
              unselectedLabelColor: Colors.black,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.red,
                ),
                insets: EdgeInsets.only(left: 10, right: 22),
              ),
              isScrollable: true,
              tabs: controller.challengersTabs
                  .map((challengersTab) => Padding(
                        padding: const EdgeInsets.only(right: 14),
                        child: challengersTab,
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: controller.tabBarController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Home(),
                PopularChallengePage(),
                NewChallengePage(),
                RecommendedChallengePage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
