import 'package:flutter_clone_small_parts/src/examples/challengers_tabBar_slider_custromScrollView/model/main_challengers_model.dart';
import 'package:flutter_clone_small_parts/src/examples/challengers_tabBar_slider_custromScrollView/repository/challengers_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<MainChallengersModel>? mainChallenges = <MainChallengersModel>[].obs;

  Future<List<MainChallengersModel>> challengeLoad() async {
    List<MainChallengersModel>? mainChallengerResults =
        await ChallengersRepository.to.loadChallenges();

    mainChallenges!(mainChallengerResults);
    return mainChallenges!.value;
  }
}
