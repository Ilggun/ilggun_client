import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShadowStyle {
  static List<BoxShadow> shadow() {
    List<BoxShadow> shadow = [
      BoxShadow(
        color: Colors.black.withOpacity(0.09),
        spreadRadius: 2,
        blurRadius: 5,
        offset: Offset(0, 3),
      )
    ];
    return shadow;
  }
}
