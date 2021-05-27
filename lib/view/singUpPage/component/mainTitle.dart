import 'package:flutter/material.dart';
import 'package:ilggun/style/colorStyle.dart';

class MainTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "반갑습니다",
              style: TextStyle(
                fontFamily: 'NanumMyeongjo',
                fontSize: 25,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
            Row(
              children: [
                Text(
                  "일꾼입니다",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  ".",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: NewColorSet.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
