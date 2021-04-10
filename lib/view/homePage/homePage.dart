import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ilggun/model/Info.dart';
import 'package:ilggun/style/colorStyle.dart';
import 'package:ilggun/view/homePage/component/buildTile.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Info> infoList = [
    Info(
        title: "산란계 1동",
        product: "A465FBE45IGP213",
        temperature: 0.1,
        humidity: 0.2,
        gas: 0.3,
        smoke: 0.4),
    Info(
        title: "산란계 2동",
        product: "A465FBE45IGP214",
        temperature: 0.5,
        humidity: 0.6,
        gas: 0.7,
        smoke: 0.8),
    Info(
        title: "산란계 3동",
        product: "A465FBE45IGP215",
        temperature: 1.5,
        humidity: 0.6,
        gas: 0.7,
        smoke: 1.8),
    Info(
        title: "산란계 4동",
        product: "A465FBE45IGP216",
        temperature: 0.5,
        humidity: 0.6,
        gas: 0.7,
        smoke: 0.8),
    Info(
        title: "육계 1동",
        product: "A465FBE45IGP217",
        temperature: 0.9,
        humidity: 1.0,
        gas: 1.1,
        smoke: 1.2),
    Info(
        title: "육계 2동",
        product: "A465FBE45IGP218",
        temperature: 1.5,
        humidity: 0.9,
        gas: 1.4,
        smoke: 0.8),
  ];
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
      backgroundColor: NewColorSet.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Column(
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
                buildSearchForm(),
              ],
            ),
            backgroundColor: NewColorSet.background,
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
                  return BuildTile(info: infoListView[index]);
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
