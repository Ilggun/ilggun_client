import 'package:flutter/foundation.dart';

class Info {
  DateTime dateTime;
  String title;
  String product;
  double temperature;
  double humidity;
  double gas;
  double smoke;

  Info(
      {DateTime dateTime,
      @required String title,
      @required String product,
      @required double temperature,
      @required double humidity,
      @required double gas,
      @required double smoke}) {
    this.dateTime = dateTime;
    this.title = title;
    this.product = product;
    this.temperature = temperature;
    this.humidity = humidity;
    this.gas = gas;
    this.smoke = smoke;
  }

  DateTime getDateTime() => dateTime;
  String getTitle() => title;
  String getProduct() => product;
  double getTemperature() => temperature;
  double getHumidity() => humidity;
  double getGas() => gas;
  double getSmoke() => smoke;

  void setDateTime(DateTime dateTime) {
    this.dateTime = dateTime;
  }

  void setTitle(String title) {
    this.title = title;
  }

  void setProduct(String product) {
    this.product = product;
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
    return "$title, $product, $temperature, $humidity, $gas, $smoke";
  }
}
