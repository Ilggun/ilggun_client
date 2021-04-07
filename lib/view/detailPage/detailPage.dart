import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ilggun/model/Info.dart';
import 'package:ilggun/style/colorStyle.dart';
import 'package:ilggun/style/shadowStyle.dart';
import 'package:ilggun/view/detailPage/component/buildMainChart.dart';
import 'package:ilggun/view/detailPage/component/circlePainter.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Info info;

  @override
  void initState() {
    info = Get.arguments;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: ShadowStyle.shadow(),
            ),
            child: Icon(
              Icons.chevron_left_rounded,
              color: ColorSet.noWarning,
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () => print("object"),
            child: Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: ShadowStyle.shadow(),
              ),
              child: Icon(
                Icons.refresh_rounded,
                color: ColorSet.noWarning,
              ),
            ),
          ),
        ],
        title: Text(
          info.title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: CirclePainter(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildTile(
                              "온도", info.temperature, ColorSet.temperature),
                          buildTile("습도", info.humidity, ColorSet.humidity),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildTile("가스", info.gas, ColorSet.gas),
                          buildTile("연기", info.smoke, ColorSet.smoke),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: BuildMainChart(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTile(String title, double value, Color color) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: Get.size.width * 0.45,
            height: Get.size.width * 0.2,
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ColorSet.white,
              boxShadow: ShadowStyle.shadow(),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: ColorSet.dark,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Stack(
                  children: [
                    Positioned(
                      bottom: 7,
                      left: 0,
                      child: Container(
                        width: 65,
                        height: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: color.withOpacity(0.6),
                        ),
                      ),
                    ),
                    Text(
                      value.toString(),
                      style: TextStyle(
                        color: ColorSet.dark,
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        value >= 1
            ? Positioned(
                left: 5,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ColorSet.warning,
                    boxShadow: ShadowStyle.shadow(),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      "경고",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
