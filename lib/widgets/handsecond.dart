import 'package:flutter/material.dart';

class HandSecond extends CustomPainter {
  final s;

  HandSecond({this.s});
  @override
  void paint(Canvas canvas, Size size) {
    var radius = size.width / 2;
    canvas.save();
    canvas.translate(radius, radius);
    canvas.rotate(this.s * 3.14 * 6.0 / 180);
    Path p = Path();
    p.moveTo(0, 0);
    p.lineTo(0, -130);
    Paint pl = Paint();
    pl.style = PaintingStyle.stroke;
    pl.color = Colors.blue;
    pl.strokeWidth = 5.0;
    pl.strokeCap = StrokeCap.values[1];

    canvas.drawPath(p, pl);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
