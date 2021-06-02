import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ilggun/model/Info.dart';
import 'package:ilggun/style/colorStyle.dart';
import 'package:ilggun/view/homePage/component/buildTile.dart';
import 'package:intl/intl.dart';

class HomePage2 extends StatefulWidget {
  @override
  _HomePageState2 createState() => _HomePageState2();
}

class _HomePageState2 extends State<HomePage2> {
  List<Info> infoList = [];
  List<Info> infoListView;

  String updateTimeText;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    updateTimeText = DateFormat('yyyy:MM:dd:kk:mm').format(DateTime.now());
    infoListView = infoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: InkWell(
              onTap: () {
                print("clicke");
                setState(() {
                  infoList.clear();
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    "안녕하세요",
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
                  // buildSearchForm(),
                ],
              ),
            ),
            backgroundColor: Colors.white,
            toolbarHeight: Get.size.height * 0.35,
            elevation: 0.0,
            floating: true,
            // flexibleSpace: Placeholder(),
            expandedHeight: 50,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index == infoListView.length)
                  return buildAddTile();
                // else if (index == infoList.length + 1)
                //   return buildRefreshButton();
                else
                  return Column(
                    children: [
                      BuildTile(info: infoListView[index]),
                      Container(
                        width: Get.size.width * 0.9,
                        height: 0.5,
                        color: Colors.grey.withOpacity(0.3),
                      ),
                    ],
                  );
              },
              childCount: infoListView.length + 1,
              /**
               * buildRefresh Button 을 사용하고 싶을 시,
               * 위 주석 활성화후, childCount: infoList.length + 2로 변경
               */
            ),
          )
        ],
      ),
    );
  }

  void search(String value) {
    // print(value);
    // List<Info> infoListTemp = [];
    // infoListView.removeAt(0);
    // print("info list $infoList");
    // infoList.forEach((element) {
    //   print("${element.title.contains(value)} : ${element.title}");
    //   if (element.title.contains(value)) {
    //     infoListTemp.add(element);
    //   }
    // });
    // print("info List Temp $infoListTemp");
    // setState(() {
    //   infoListTemp.forEach((element) {
    //     infoListView.add(element);
    //   });
    // });
  }

  Widget buildSearchForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 15),
      child: Container(
        // decoration: BoxDecoration(
        //     border: Border(
        //         bottom: BorderSide(color: Colors.grey.withOpacity(0.8)))),
        child: TextFormField(
          enableInteractiveSelection: false,
          controller: _searchController,
          style: TextStyle(
            color: NewColorSet.blue,
            fontSize: 20,
          ),
          onEditingComplete: () {
            search(_searchController.text);
          },
          decoration: InputDecoration(
            suffix: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _searchController.clear();
                FocusScope.of(context).unfocus(); //  활성화 상태인 키보드 끄기.
              },
              color: NewColorSet.blue,
            ),
            border: InputBorder.none,
            hintText: "검색",
            hintStyle: TextStyle(color: Colors.grey.withOpacity(0.8)),
          ),
        ),
      ),
    );
  }

  Widget buildRefreshButton() {
    return InkWell(
      onTap: () {
        setState(() {
          DateTime dateTimeNow = DateTime.now();
          updateTimeText = DateFormat('yyyy:MM:dd:kk:mm').format(dateTimeNow);
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                CupertinoIcons.refresh,
                color: Colors.black,
              ),
              Text(
                " 최근 업데이트 : $updateTimeText",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAddTile() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: InkWell(
        onTap: () => Get.toNamed('/addPage'),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black12,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
