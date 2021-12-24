import 'package:flutter_clone_small_parts/src/examples/challengers_tabBar_slider/model/main_challengers_model.dart';
import 'package:get/get.dart';

class ChallengersRepository extends GetConnect {
  static ChallengersRepository get to => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = 'https://picsum.photos/v2';
    super.onInit();
  }

  Future<List<MainChallengersModel>?> loadChallenges() async {
    String url = '/list?page=101&limit=8';
    Response response = await get(url);

    if (response.hasError) {
      return Future.error(response.statusText!);
    } else {
      List<dynamic> list = response.body;

      return list
          .map<MainChallengersModel>(
              (item) => MainChallengersModel.fromJson(item))
          .toList();
    }
  }
}
