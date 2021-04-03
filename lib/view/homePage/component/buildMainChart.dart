import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ilggun/style/colorStyle.dart';
import 'package:intl/intl.dart';

class BuildMainChart extends StatefulWidget {
  @override
  _BuildMainChartState createState() => _BuildMainChartState();
}

class _BuildMainChartState extends State<BuildMainChart> {
  List<LineChartBarData> lineChartBarDataList = <LineChartBarData>[];
  List<LineChartBarData> lineChartBarDataListView = <LineChartBarData>[];

  LineChartBarData lineChartBarData1 = LineChartBarData(
    spots: [
      FlSpot(1, 1),
      FlSpot(2, 1.5),
      FlSpot(3, 1.4),
      FlSpot(4, 3.4),
      FlSpot(5, 2),
      FlSpot(6, 2.2),
      FlSpot(7, 1.8),
    ],
    isCurved: false,
    colors: [
      ColorSet.temperatureOp,
    ],
    barWidth: 3,
    isStrokeCapRound: true,
    dotData: FlDotData(
      show: true,
    ),
    belowBarData: BarAreaData(show: false, colors: [
      const Color(0x224af699),
    ]),
  );
  LineChartBarData lineChartBarData2 = LineChartBarData(
    spots: [
      FlSpot(1, 1),
      FlSpot(2, 2.8),
      FlSpot(3, 1.2),
      FlSpot(4, 2.8),
      FlSpot(5, 2.6),
      FlSpot(6, 1.2),
      FlSpot(7, 3.9),
    ],
    isCurved: false,
    colors: [
      ColorSet.humidityOp,
    ],
    barWidth: 3,
    isStrokeCapRound: true,
    dotData: FlDotData(
      show: true,
    ),
    belowBarData: BarAreaData(show: false, colors: [
      const Color(0x22aa4cfc),
      const Color(0xffffffff),
    ]),
  );
  LineChartBarData lineChartBarData3 = LineChartBarData(
    spots: [
      FlSpot(1, 2.8),
      FlSpot(2, 1.9),
      FlSpot(3, 3),
      FlSpot(4, 1.3),
      FlSpot(5, 2.5),
      FlSpot(6, 1.3),
      FlSpot(7, 2.5),
    ],
    isCurved: false,
    colors: const [
      ColorSet.gasOp,
    ],
    barWidth: 3,
    isStrokeCapRound: false,
    dotData: FlDotData(
      show: true,
    ),
    belowBarData: BarAreaData(show: false, colors: [
      const Color(0x2227b6fc),
    ]),
  );

  LineChartBarData lineChartBarData4 = LineChartBarData(
    spots: [
      FlSpot(1, 2.8),
      FlSpot(2, 2.9),
      FlSpot(3, 1.3),
      FlSpot(4, 1.1),
      FlSpot(5, 2.2),
      FlSpot(6, 1.5),
      FlSpot(7, 2.1),
    ],
    isCurved: false,
    colors: const [
      ColorSet.smokeOp,
    ],
    barWidth: 3,
    isStrokeCapRound: false,
    dotData: FlDotData(
      show: true,
    ),
    belowBarData: BarAreaData(show: false, colors: [
      const Color(0x2227b6fc),
    ]),
  );

  @override
  void initState() {
    lineChartBarDataList.add(lineChartBarData1);
    lineChartBarDataList.add(lineChartBarData2);
    lineChartBarDataList.add(lineChartBarData3);
    lineChartBarDataList.add(lineChartBarData4);
    lineChartBarDataListView = lineChartBarDataList;
    super.initState();
  }

  String convertDateTime(DateTime dateTime) {
    return DateFormat('M.d').format(dateTime).toString();
  }

  String convertDateTimeTitle(DateTime dateTime) {
    return DateFormat('y년 M월 d일').format(dateTime).toString();
  }

  @override
  Widget build(BuildContext context) {
    DateTime dateTimeNow = DateTime.now();

    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        color: Colors.white,
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
                      Text(
                        '일간',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '주간',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '월간',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '연간',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  convertDateTimeTitle(
                          dateTimeNow.subtract(Duration(days: 6))) +
                      ' ~ ' +
                      convertDateTimeTitle(dateTimeNow),
                  style: TextStyle(
                    color: Color(0xff827daa),
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 37,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0, left: 6.0),
                    child: LineChart(
                      sampleData1(),
                      swapAnimationDuration: const Duration(milliseconds: 250),
                    ),
                  ),
                ),
                buildButton(),
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
          }
          setState(() {});
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color,
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

  LineChartData sampleData1() {
    DateTime dateTimeNow = DateTime.now();
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.white,
        ),
        touchCallback: (LineTouchResponse touchResponse) {
          print(touchResponse);
        },
        handleBuiltInTouches: true,
      ),
      gridData: FlGridData(
        show: true,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff72719b),
            fontWeight: FontWeight.normal,
            fontSize: 12,
          ),
          margin: 10,
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return convertDateTime(dateTimeNow.subtract(Duration(days: 6)));
              case 2:
                return convertDateTime(dateTimeNow.subtract(Duration(days: 5)));
              case 3:
                return convertDateTime(dateTimeNow.subtract(Duration(days: 4)));
              case 4:
                return convertDateTime(dateTimeNow.subtract(Duration(days: 3)));
              case 5:
                return convertDateTime(dateTimeNow.subtract(Duration(days: 2)));
              case 6:
                return convertDateTime(dateTimeNow.subtract(Duration(days: 1)));
              case 7:
                return convertDateTime(dateTimeNow);
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          showTitles: false,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff75729e),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '1m';
              case 2:
                return '2m';
              case 3:
                return '3m';
              case 4:
                return '5m';
            }
            return '';
          },
          margin: 8,
          reservedSize: 30,
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: const Border(
          left: BorderSide(
            color: Colors.transparent,
          ),
          right: BorderSide(
            color: Colors.transparent,
          ),
          top: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      minX: 0,
      maxX: 8,
      maxY: 4,
      minY: 0,
      lineBarsData: lineChartBarDataList,
    );
  }
}
