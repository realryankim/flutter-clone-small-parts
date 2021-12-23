import 'package:flutter_clone_small_parts/src/examples/challengers_tabBar_slider_custromScrollView/binding/binding.dart';
import 'package:flutter_clone_small_parts/src/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Clone Small Parts',
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      initialBinding: Binding(),
      getPages: [
        GetPage(
          name: '/',
          page: () => MainScreen(),
          transition: Transition.noTransition,
        ),
      ],
    );
  }
}
