import 'dart:async';
import 'dart:isolate';
import 'dart:math';

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
  Isolate _isolate;
  bool _running = false;
  ReceivePort _receivePort;
  static int _counter = 0;

  Random _random = new Random();
  List<Info> infoList = [];
  List<Info> infoListView;

  String updateTimeText;
  TextEditingController _searchController = TextEditingController();

  void addInfo() {
    Random random = new Random();
    infoList.add(
      Info(
          title: "서버실 1",
          product: "A465FBE45IGP213",
          temperature: 0.28 + (random.nextDouble() * 0.005),
          humidity: 0.20 + (random.nextDouble() * 0.005),
          gas: 0.0,
          smoke: 0.0),
    );
    infoList.add(
      Info(
          title: "서버실 2",
          product: "A465FBE45IGP214",
          temperature: _random.nextDouble(),
          humidity: _random.nextDouble(),
          gas: _random.nextDouble(),
          smoke: _random.nextDouble()),
    );
    infoList.add(
      Info(
          title: "서버실 3",
          product: "A465FBE45IGP215",
          temperature: _random.nextDouble(),
          humidity: _random.nextDouble(),
          gas: _random.nextDouble(),
          smoke: _random.nextDouble()),
    );
    infoList.add(
      Info(
          title: "서버실 4",
          product: "A465FBE45IGP216",
          temperature: _random.nextDouble(),
          humidity: _random.nextDouble(),
          gas: _random.nextDouble(),
          smoke: _random.nextDouble()),
    );
    infoList.add(
      Info(
          title: "서버실 5",
          product: "A465FBE45IGP217",
          temperature: _random.nextDouble(),
          humidity: _random.nextDouble(),
          gas: _random.nextDouble(),
          smoke: _random.nextDouble()),
    );
    infoList.add(
      Info(
          title: "서버실 6",
          product: "A465FBE45IGP218",
          temperature: _random.nextDouble(),
          humidity: _random.nextDouble(),
          gas: _random.nextDouble(),
          smoke: _random.nextDouble()),
    );
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      _start();
    });

    updateTimeText = DateFormat('yyyy:MM:dd:kk:mm').format(DateTime.now());

    addInfo();
    infoListView = infoList;
    super.initState();
  }

  void _start() async {
    _running = true;
    _receivePort = ReceivePort();
    _isolate = await Isolate.spawn(_checkTImer, _receivePort.sendPort);
    _receivePort.listen(_handleMessage, onDone: () {
      print("done!");
    });
  }

  static void _checkTImer(SendPort sendPort) async {
    Timer.periodic(new Duration(seconds: 10), (Timer t) async {
      _counter++;
      String msg = 'notification ' + _counter.toString();
      sendPort.send(msg);
    });
  }

  void sendData(var data) {
    print(data);
  }

  void _handleMessage(dynamic data) async {
    setState(() {
      infoList.clear();
      addInfo();
    });
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
                  addInfo();
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
