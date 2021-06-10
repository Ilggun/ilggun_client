import 'dart:math';

import 'package:ilggun/model/Info.dart';

class DataInput {
  List<Info> infoList = <Info>[];

  DataInput();

  List<Info> getInfoList() {
    Random random = new Random();

    for (int i = 1; i < 20; i++) {
      infoList.add(
        new Info(
            dateTime: DateTime.now().subtract(Duration(minutes: 10 * i)),
            title: "",
            product: "",
            temperature: random.nextDouble(),
            humidity: random.nextDouble(),
            gas: random.nextDouble(),
            smoke: random.nextDouble()),
      );
    }
    return infoList;
  }

  List<Info> getInfoListD() {
    Random random = new Random();

    for (int i = 1; i < 20; i++) {
      infoList.add(
        new Info(
            dateTime: DateTime.now().subtract(Duration(minutes: 10 * i)),
            title: "",
            product: "",
            temperature: 0.28 + (random.nextDouble() * 0.005),
            humidity: 0.20 + (random.nextDouble() * 0.005),
            gas: 00,
            smoke: 00),
      );
    }
    return infoList;
  }
}
