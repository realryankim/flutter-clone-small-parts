import 'package:flutter/material.dart';

class ChallengeCategory extends StatelessWidget {
  const ChallengeCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(width: 60, height: 60, color: Colors.grey),
              Container(width: 60, height: 60, color: Colors.grey),
              Container(width: 60, height: 60, color: Colors.grey),
              Container(width: 60, height: 60, color: Colors.grey),
              Container(width: 60, height: 60, color: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }
}
