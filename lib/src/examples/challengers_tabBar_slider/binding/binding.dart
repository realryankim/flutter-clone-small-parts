import 'package:flutter_clone_small_parts/src/examples/challengers_tabBar_slider/controller/home_controller.dart';
import 'package:flutter_clone_small_parts/src/examples/challengers_tabBar_slider/repository/challengers_repository.dart';
import 'package:get/get.dart';

class Binding implements Bindings {
  @override
  void dependencies() {
    Get.put(ChallengersRepository(), permanent: true);
  }
}
