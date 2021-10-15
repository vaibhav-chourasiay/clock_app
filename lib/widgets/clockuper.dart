import 'package:flutter/material.dart';

class ClockUper extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var radius = size.width / 2;
    canvas.save();
    canvas.translate(radius, radius);
    Paint p = Paint();

    p.color = Colors.black;
    p.style = PaintingStyle.stroke;
    p.strokeWidth = 20.0;

    Path uper = Path();
    uper.moveTo(-80.0, -radius - 10);
    uper.lineTo(-50.0, -radius - 60);
    uper.lineTo(50.0, -radius - 60);
    uper.lineTo(80.0, -radius - 10);

    canvas.drawPath(uper, p);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
