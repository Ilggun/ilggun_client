import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ilggun/model/Info.dart';
import 'package:ilggun/style/colorStyle.dart';

class BuildTile extends StatelessWidget {
  final Info info;

  BuildTile({@required this.info});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: InkWell(
        onTap: () => Get.toNamed('/detailPage', arguments: info),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorSet.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    info.title,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: ColorSet.dark,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    buildBadge("온도", info.temperature),
                    buildBadge("습도", info.humidity),
                    buildBadge("가스", info.gas),
                    buildBadge("연기", info.smoke),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBadge(String title, double value) {
    Color warningColor = value >= 1 ? ColorSet.warning : ColorSet.noWarning;
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: warningColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Text(
            title + " " + value.toString(),
            style: TextStyle(
              color: ColorSet.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
