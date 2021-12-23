import 'package:flutter_clone_small_parts/src/examples/challengers_tabBar_slider_custromScrollView/controller/home_controller.dart';
import 'package:flutter_clone_small_parts/src/examples/challengers_tabBar_slider_custromScrollView/repository/challengers_repository.dart';
import 'package:get/get.dart';

class Binding implements Bindings {
  @override
  void dependencies() {
    // TODO: binding 나누기
    Get.put(ChallengersRepository(), permanent: true);
  }
}
