import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:ilggun/model/Info.dart';
import 'package:ilggun/style/colorStyle.dart';
import 'package:ilggun/style/shadowStyle.dart';

class BuildTile extends StatelessWidget {
  final Info info;

  BuildTile({@required this.info});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: InkWell(
        onTap: () => Get.toNamed('/detailPage', arguments: info),
        child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          secondaryActions: [
            buildUpdateButton(),
            buildDeleteButton(),
          ],
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorSet.white,
              boxShadow: ShadowStyle.shadow(),
            ),
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
      ),
    );
  }

  Widget buildUpdateButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey,
          boxShadow: ShadowStyle.shadow(),
        ),
        child: SlideAction(
          child: Text(
            "수정",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: ColorSet.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDeleteButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorSet.warning,
          boxShadow: ShadowStyle.shadow(),
        ),
        child: SlideAction(
          child: Text(
            "삭제",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: ColorSet.white,
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
