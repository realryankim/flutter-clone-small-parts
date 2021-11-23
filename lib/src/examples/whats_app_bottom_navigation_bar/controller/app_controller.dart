import 'package:get/get.dart';

enum RouteName {
  STATUS,
  CALLS,
  CAMERA,
  CHATS,
  SETTINGS,
}

class AppController extends GetxService {
  static AppController get to => Get.find();

  RxInt currentIndex = 0.obs;

  void changePageIndex(int index) {
    currentIndex(index);
  }
}
