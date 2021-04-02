import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ilggun/model/Info.dart';
import 'package:ilggun/view/component/buildTile.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Info> infoList = [
    Info(
        title: "산란계 1동", temperature: 0.1, humidity: 0.2, gas: 0.3, smoke: 0.4),
    Info(
        title: "산란계 2동", temperature: 0.5, humidity: 0.6, gas: 0.7, smoke: 0.8),
    Info(
        title: "산란계 3동", temperature: 1.5, humidity: 0.6, gas: 0.7, smoke: 1.8),
    Info(
        title: "산란계 4동", temperature: 0.5, humidity: 0.6, gas: 0.7, smoke: 0.8),
    Info(title: "육계 1동", temperature: 0.9, humidity: 1.0, gas: 1.1, smoke: 1.2),
    Info(title: "육계 2동", temperature: 1.5, humidity: 0.9, gas: 1.4, smoke: 0.8),
  ];

  String updateTimeText;

  @override
  void initState() {
    updateTimeText = DateFormat('yyyy:MM:dd:kk:mm').format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              "일 꾼 🛠",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0.0,
            floating: true,
            // flexibleSpace: Placeholder(),
            expandedHeight: 50,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index == infoList.length)
                  return buildRefreshButton();
                else
                  return BuildTile(info: infoList[index]);
              },
              childCount: infoList.length + 1,
            ),
          )
        ],
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
}
