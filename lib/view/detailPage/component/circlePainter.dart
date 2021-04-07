import 'package:flutter/material.dart';
import 'package:ilggun/style/colorStyle.dart';

class CirclePainter extends CustomPainter {
  final Paint lightBluePaint = Paint()..color = ColorSet.noWarning;

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromLTWH(size.width * 0.1, -size.width * 0.95,
        size.width * 1.2, size.width * 1.2);
    final Path smallCircle = Path()..addOval(rect.inflate(50));

    canvas.drawPath(smallCircle, lightBluePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
