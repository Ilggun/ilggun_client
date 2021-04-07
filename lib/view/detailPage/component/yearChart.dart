import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ilggun/service/GasData.dart';
import 'package:ilggun/service/HumidityData.dart';
import 'package:ilggun/service/SmokeData.dart';
import 'package:ilggun/service/TemperatureData.dart';
import 'package:ilggun/style/colorStyle.dart';
import 'package:intl/intl.dart';

class YearChart extends StatefulWidget {
  @override
  _YearChartState createState() => _YearChartState();
}

class _YearChartState extends State<YearChart> {
  List<LineChartBarData> lineChartBarDataList = <LineChartBarData>[];
  List<LineChartBarData> lineChartBarDataListView = <LineChartBarData>[];

  LineChartBarData temperatureData = LineChartBarData(
    spots: TemperatureData().getYear(),
    isCurved: true,
    colors: [
      ColorSet.temperatureOp,
    ],
    barWidth: 3,
    isStrokeCapRound: false,
    dotData: FlDotData(
      show: false,
    ),
    belowBarData: BarAreaData(show: false, colors: [
      const Color(0x224af699),
    ]),
  );
  LineChartBarData humidityData = LineChartBarData(
    spots: HumidityData().getYear(),
    isCurved: true,
    colors: [
      ColorSet.humidityOp,
    ],
    barWidth: 3,
    isStrokeCapRound: false,
    dotData: FlDotData(
      show: false,
    ),
    belowBarData: BarAreaData(show: false, colors: [
      const Color(0x22aa4cfc),
      const Color(0xffffffff),
    ]),
  );
  LineChartBarData gasData = LineChartBarData(
    spots: GasData().getYear(),
    isCurved: true,
    colors: const [
      ColorSet.gasOp,
    ],
    barWidth: 3,
    isStrokeCapRound: false,
    dotData: FlDotData(
      show: false,
    ),
    belowBarData: BarAreaData(show: false, colors: [
      const Color(0x2227b6fc),
    ]),
  );

  LineChartBarData smokeData = LineChartBarData(
    spots: SmokeData().getYear(),
    isCurved: true,
    colors: const [
      ColorSet.smokeOp,
    ],
    barWidth: 3,
    isStrokeCapRound: false,
    dotData: FlDotData(
      show: false,
    ),
    belowBarData: BarAreaData(show: false, colors: [
      const Color(0x2227b6fc),
    ]),
  );

  String convertDateTime(DateTime dateTime) {
    return DateFormat('M월').format(dateTime).toString();
  }

  @override
  void initState() {
    lineChartBarDataList.add(temperatureData);
    lineChartBarDataList.add(humidityData);
    lineChartBarDataList.add(gasData);
    lineChartBarDataList.add(smokeData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LineChart(
      chartData(),
      swapAnimationDuration: const Duration(milliseconds: 250),
    );
  }

  LineChartData chartData() {
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
        show: false,
        drawHorizontalLine: true,
        drawVerticalLine: true,
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
              case 2:
                return convertDateTime(
                    dateTimeNow.subtract(Duration(days: 300)));
              case 4:
                return convertDateTime(
                    dateTimeNow.subtract(Duration(days: 240)));
              case 6:
                return convertDateTime(
                    dateTimeNow.subtract(Duration(days: 180)));
              case 8:
                return convertDateTime(
                    dateTimeNow.subtract(Duration(days: 120)));
              case 10:
                return convertDateTime(
                    dateTimeNow.subtract(Duration(days: 60)));
              case 12:
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
          margin: 5,
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
      maxX: 13,
      maxY: 1.5,
      minY: 0,
      lineBarsData: lineChartBarDataList,
    );
  }
}
