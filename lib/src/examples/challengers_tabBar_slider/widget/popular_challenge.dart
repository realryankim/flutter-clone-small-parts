import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularChallenge extends StatelessWidget {
  const PopularChallenge({Key? key}) : super(key: key);

  // Widget _makeGridView() {
  //   return SliverPadding(
  //     padding: EdgeInsets.symmetric(horizontal: 15.0),
  //     sliver: SliverGrid(
  //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //         crossAxisCount: 2,
  //         mainAxisExtent: 10.0,
  //         crossAxisSpacing: 10.0,
  //       ),
  //       delegate: SliverChildListDelegate(
  //         List.generate(
  //           4,
  //           (index) {
  //             return Container(
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.stretch,
  //                 children: [
  //                   ClipRRect(
  //                     borderRadius: BorderRadius.circular(6.0),
  //                     child: Container(color: Colors.grey, height: 120),
  //                   ),
  //                   SizedBox(height: 8.0),
  //                   Text('공식 챌린지'),
  //                   SizedBox(height: 8.0),
  //                   Text('100 Days of Coding'),
  //                   SizedBox(height: 8.0),
  //                   Text('오늘부터 시작'),
  //                 ],
  //               ),
  //             );
  //           },
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _makeGridView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          SizedBox(
            height: 380,
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 1.8),
              crossAxisSpacing: 10,
              mainAxisSpacing: 2,
              physics: NeverScrollableScrollPhysics(),
              children: [
                ...List.generate(
                  4,
                  (index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6.0),
                          child: Container(color: Colors.grey, height: 100),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          '공식 챌린지',
                          style: TextStyle(fontSize: 10.0, color: Colors.grey),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          '100 Days of Coding',
                          style: TextStyle(fontSize: 11.0),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          '오늘부터 시작',
                          style: TextStyle(fontSize: 10.0, color: Colors.grey),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '인기 챌린지',
                style: TextStyle(color: Colors.black, fontSize: 20.0),
              ),
              Icon(
                Icons.keyboard_arrow_right,
                color: Colors.black,
                size: 28.0,
              ),
            ],
          ),
        ),
        // TODO: TabBar
        SizedBox(height: 20.0),

        // GridView
        _makeGridView(context),
      ],
    );
  }
}
