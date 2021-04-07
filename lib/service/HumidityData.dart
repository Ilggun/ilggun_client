import 'dart:math';
import 'package:fl_chart/fl_chart.dart';

class HumidityData {
  HumidityData();

  List<FlSpot> _spotData = <FlSpot>[];

  List<FlSpot> getDay() {
    _spotData.clear();
    Random random = new Random();
    for (var i = 1; i <= 12; i++) {
      _spotData.add(FlSpot(i.toDouble(), random.nextDouble()));
    }
    return _spotData;
  }

  List<FlSpot> getWeek() {
    _spotData.clear();
    Random random = new Random();
    for (var i = 1; i <= 7; i++) {
      _spotData.add(FlSpot(i.toDouble(), random.nextDouble()));
    }
    return _spotData;
  }

  List<FlSpot> getMonth() {
    _spotData.clear();
    Random random = new Random();
    for (var i = 1; i <= 30; i++) {
      _spotData.add(FlSpot(i.toDouble(), random.nextDouble()));
    }
    return _spotData;
  }

  List<FlSpot> getYear() {
    _spotData.clear();
    Random random = new Random();
    for (var i = 1; i <= 12; i++) {
      _spotData.add(FlSpot(i.toDouble(), random.nextDouble()));
    }
    return _spotData;
  }
}
