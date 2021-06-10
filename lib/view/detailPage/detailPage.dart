import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ilggun/model/Info.dart';
import 'package:ilggun/service/DataInput.dart';
import 'package:ilggun/style/colorStyle.dart';
import 'package:ilggun/style/shadowStyle.dart';
import 'package:ilggun/view/detailPage/component/buildMainChart.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<Info> infoList;
  Info info;

  @override
  void initState() {
    info = Get.arguments;
    if (info.title == "서버실 1")
      infoList = DataInput().getInfoListD();
    else
      infoList = DataInput().getInfoList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSet.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              // color: Colors.white,
              shape: BoxShape.circle,
              // boxShadow: ShadowStyle.shadow(),
            ),
            child: Icon(
              Icons.chevron_left_rounded,
              color: ColorSet.dark,
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
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.refresh_rounded,
                color: ColorSet.dark,
              ),
            ),
          ),
        ],
        title: Text(
          info.title,
          style: TextStyle(
            color: ColorSet.dark,
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 0.0,
      ),
      body: Padding(
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
                      buildTile("온도", info.temperature),
                      buildTile("습도", info.humidity),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildTile("가스", info.gas),
                      buildTile("연기", info.smoke),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 30),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        "현재까지 기록된 정보입니다",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ".",
                        style: TextStyle(
                          fontSize: 30,
                          color: NewColorSet.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            buildList(context),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 10),
            //   child: BuildMainChart(),
            // ),
          ],
        ),
      ),
    );
  }

  Widget buildList(BuildContext buildContext) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: infoList.length,
        itemBuilder: (BuildContext context, int index) {
          String formatData = DateFormat('yyyy년 M월 d일 kk시 mm분')
              .format(infoList[index].dateTime);
          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 1,
                      width: Get.size.width,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    const SizedBox(height: 10),
                    Text(formatData),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildListElement("온도", infoList[index].temperature),
                        buildListElement("습도", infoList[index].humidity),
                        buildListElement("가스", infoList[index].gas),
                        buildListElement("연기", infoList[index].smoke),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildListElement(String title, double value) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),
        Text(
          (value * 100) < 10
              ? "0" + (value * 100).toStringAsFixed(0)
              : (value * 100).toStringAsFixed(0),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: value >= 0.5 ? NewColorSet.red : NewColorSet.blue,
          ),
        ),
      ],
    );
  }

  Widget buildTile(String title, double value) {
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
                      bottom: 2,
                      left: 0,
                      child: Container(
                        width: 50,
                        height: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:
                              value >= 0.5 ? NewColorSet.red : NewColorSet.blue,
                        ),
                      ),
                    ),
                    Text(
                      (value * 100) < 10
                          ? "0" + (value * 100).toStringAsFixed(0)
                          : (value * 100).toStringAsFixed(0),
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
        // value >= 0.5
        //     ? Positioned(
        //         left: 5,
        //         child: Container(
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(20),
        //             color: ColorSet.warning,
        //             boxShadow: ShadowStyle.shadow(),
        //           ),
        //           child: Padding(
        //             padding:
        //                 const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        //             child: Text(
        //               "경고",
        //               style: TextStyle(
        //                 color: Colors.white,
        //                 fontWeight: FontWeight.bold,
        //               ),
        //             ),
        //           ),
        //         ),
        //       )
        //     : Container(),
      ],
    );
  }
}
