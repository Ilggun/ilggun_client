import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ilggun/service/GasData.dart';
import 'package:ilggun/service/HumidityData.dart';
import 'package:ilggun/service/SmokeData.dart';
import 'package:ilggun/service/TemperatureData.dart';
import 'package:ilggun/style/colorStyle.dart';
import 'package:ilggun/style/shadowStyle.dart';
import 'package:ilggun/view/detailPage/component/dayChart.dart';
import 'package:ilggun/view/detailPage/component/monthChart.dart';
import 'package:ilggun/view/detailPage/component/weekChart.dart';
import 'package:ilggun/view/detailPage/component/yearChart.dart';
import 'package:intl/intl.dart';

class BuildMainChart extends StatefulWidget {
  @override
  _BuildMainChartState createState() => _BuildMainChartState();
}

class _BuildMainChartState extends State<BuildMainChart> {
  int selectedRangeButtonIndex;

  @override
  void initState() {
    selectedRangeButtonIndex = 0;
    super.initState();
  }

  String convertDateTime(DateTime dateTime) {
    return DateFormat('M.d').format(dateTime).toString();
  }

  String convertDateTimeTitle(DateTime dateTime) {
    return DateFormat('y년 M월 d일').format(dateTime).toString();
  }

  Widget buildRangeButton({@required String title}) {
    int index;
    switch (title) {
      case "일간":
        index = 0;
        break;
      case "주간":
        index = 1;
        break;
      case "월간":
        index = 2;
        break;
      case "연간":
        index = 3;
        break;
      default:
    }
    return InkWell(
      onTap: () {
        setState(() {
          selectedRangeButtonIndex = index;
        });
      },
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 3,
            child: Container(
              width: 40,
              height: 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: selectedRangeButtonIndex == index
                    ? ColorSet.noWarning.withOpacity(0.7)
                    : ColorSet.white,
              ),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: selectedRangeButtonIndex == index
                  ? Colors.black
                  : Colors.grey,
              fontSize: 22,
              fontWeight: selectedRangeButtonIndex == index
                  ? FontWeight.bold
                  : FontWeight.normal,
              letterSpacing: 2,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget buildRangeText() {
    DateTime dateTimeNow = DateTime.now();
    String result;
    switch (selectedRangeButtonIndex) {
      case 0:
        result =
            convertDateTimeTitle(dateTimeNow.subtract(Duration(hours: 24)));
        break;
      case 1:
        result = convertDateTimeTitle(dateTimeNow.subtract(Duration(days: 6)));
        break;
      case 2:
        result = convertDateTimeTitle(dateTimeNow.subtract(Duration(days: 30)));
        break;
      case 3:
        result =
            convertDateTimeTitle(dateTimeNow.subtract(Duration(days: 365)));
        break;
      default:
    }
    result += ' ~ ' + convertDateTimeTitle(dateTimeNow);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 60),
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: ColorSet.noWarning,
        borderRadius: BorderRadius.circular(20),
        boxShadow: ShadowStyle.shadow(),
      ),
      child: Text(
        result,
        style: TextStyle(
            color: ColorSet.white, fontSize: 16, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        color: Colors.transparent,
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildRangeButton(title: "일간"),
                      buildRangeButton(title: "주간"),
                      buildRangeButton(title: "월간"),
                      buildRangeButton(title: "연간"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                buildRangeText(),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 0.0, left: 0.0),
                    child: selectedRangeButtonIndex == 0
                        ? DayChart()
                        : selectedRangeButtonIndex == 1
                            ? WeekChart()
                            : selectedRangeButtonIndex == 2
                                ? MonthChart()
                                : selectedRangeButtonIndex == 3
                                    ? YearChart()
                                    : null,
                  ),
                ),
                // const SizedBox(
                //   height: 10,
                // ),
                // buildButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        buildBadge(title: "온도", color: ColorSet.temperature),
        buildBadge(title: "습도", color: ColorSet.humidity),
        buildBadge(title: "가스", color: ColorSet.gas),
        buildBadge(title: "연기", color: ColorSet.smoke),
      ],
    );
  }

  Widget buildBadge({@required String title, @required Color color}) {
    int tapIndex;
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: () {
          switch (title) {
            case "온도":
              tapIndex = 0;
              break;
            case "습도":
              tapIndex = 1;
              break;
            case "가스":
              tapIndex = 2;
              break;
            case "연기":
              tapIndex = 3;
              break;
            default:
              tapIndex = 404;
              break;
          }
          setState(() {
            print(tapIndex);
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color,
            boxShadow: ShadowStyle.shadow(),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Text(
              title,
              style: TextStyle(
                color: ColorSet.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
