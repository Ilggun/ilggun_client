import 'package:flutter/foundation.dart';

class Info {
  String title;
  double temperature;
  double humidity;
  double gas;
  double smoke;

  Info(
      {@required String title,
      @required double temperature,
      @required double humidity,
      @required double gas,
      @required double smoke}) {
    this.title = title;
    this.temperature = temperature;
    this.humidity = humidity;
    this.gas = gas;
    this.smoke = smoke;
  }

  String getTitle() => title;
  double getTemperature() => temperature;
  double getHumidity() => humidity;
  double getGas() => gas;
  double getSmoke() => smoke;

  void setTitle(String title) {
    this.title = title;
  }

  void setTemperature(double temperature) {
    this.temperature = temperature;
  }

  void setHumidity(double humidity) {
    this.humidity = humidity;
  }

  void setGas(double gas) {
    this.gas = gas;
  }

  void setSmoke(double smoke) {
    this.smoke = smoke;
  }

  @override
  String toString() {
    return "$title, $temperature, $humidity, $gas, $smoke";
  }
}
