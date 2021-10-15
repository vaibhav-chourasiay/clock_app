import 'package:flutter/material.dart';

class Handmin extends CustomPainter {
  final minater;

  Handmin({this.minater});
  @override
  void paint(Canvas canvas, Size size) {
    var radius = size.width / 2;
    canvas.save();
    canvas.translate(radius, radius);
    canvas.rotate(this.minater * 3.14 * 6.0 / 180);
    Path p = Path();
    p.moveTo(0, 0);
    p.lineTo(0, -110);
    Paint pl = Paint();
    pl.style = PaintingStyle.stroke;
    pl.color = Colors.redAccent;
    pl.strokeWidth = 10.0;
    pl.strokeCap = StrokeCap.values[1];

    canvas.drawPath(p, pl);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
