import 'package:flutter/widgets.dart';
import 'package:ilggun/style/colorStyle.dart';

class TextStyleSet {
  static TextStyle hintStyle() {
    return TextStyle(
      fontWeight: FontWeight.w200,
      fontSize: 18,
    );
  }

  static TextStyle labelStyle() {
    return TextStyle(
      color: NewColorSet.blue,
      fontWeight: FontWeight.w600,
      fontSize: 15,
    );
  }
}
