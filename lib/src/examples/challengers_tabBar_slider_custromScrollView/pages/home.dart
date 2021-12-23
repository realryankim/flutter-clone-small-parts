import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_small_parts/src/examples/challengers_tabBar_slider_custromScrollView/controller/home_controller.dart';
import 'package:flutter_clone_small_parts/src/examples/challengers_tabBar_slider_custromScrollView/model/main_challengers_model.dart';
import 'package:get/get.dart';

class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);

  Widget buildImage(
      List<MainChallengersModel> imageList, String urlImage, int index) {
    double width = Get.width;
    int currentPage = index + 1;
    int totalPage = imageList.length;
    return Stack(
      // issue: 이미지 로드가 너무 늦다. 이미지 파일 크기가 커서 그런걸까?
      children: [
        Image.network(
          urlImage,
          fit: BoxFit.cover,
          width: width,
        ),
        Positioned(
          left: 30,
          bottom: 20,
          child: ElevatedButton(
            onPressed: () {
              print('바로가기');
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.only(left: 8.0, right: 4.0),
              primary: Colors.white,
              elevation: 0.0,
            ),
            child: Row(
              children: [
                Text(
                  "바로가기",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.black,
                  size: 16.0,
                )
              ],
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            padding: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.8),
            ),
            child: Text(
              '$currentPage / $totalPage 전체보기',
              style: TextStyle(
                color: Colors.white,
                fontSize: 11.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _makeSliderImage(List<MainChallengersModel> imageList) {
    return Obx(
      () => Container(
        child: Stack(
          children: [
            CarouselSlider.builder(
              itemBuilder: (context, index, realIndex) {
                String? urlImage = imageList[index].downloadUrl;

                return buildImage(imageList, urlImage!, index);
              },
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 8),
                initialPage: 0,
                viewportFraction: 1,
                onPageChanged: (index, reason) {},
              ),
              itemCount: controller.mainChallenges!.length,
            ),
          ],
        ),
      ),
    );
  }

  Widget _makeImageList(List<MainChallengersModel> imageList) {
    return CustomScrollView(
      // controller: ,
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              // 이미지 슬라이더
              _makeSliderImage(imageList),
            ],
          ),
        ),
      ],
    );
  }

  Widget _bodyWidget() {
    return FutureBuilder(
      // 시간 소요 요소: FutureBuilder
      // 해결: FutureBuilder를 사용할 때, future에 할당하는 함수(in HomeController)는 void가 아닌 return 값이어야 snapshot에 데이터가 들어온다. 당연한 걸...😥
      future: controller.challengeLoad(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('데이터 오류'));
        }

        if (snapshot.hasData) {
          return _makeImageList(controller.mainChallenges!);
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    return _bodyWidget();
  }
}
