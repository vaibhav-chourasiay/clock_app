import 'package:flutter/material.dart';

class Handhour extends CustomPainter {
  final Paint hourHandPaint;
  int hours;
  int minutes;

  Handhour({required this.hours, required this.minutes})
      : hourHandPaint = new Paint() {
    hourHandPaint.color = Colors.black87;
    hourHandPaint.style = PaintingStyle.fill;
    hourHandPaint.strokeWidth = 20.0;
  }
  @override
  void paint(Canvas canvas, Size size) {
    var radius = size.width / 2;
    canvas.save();
    canvas.translate(radius, radius);
    if (hours > 12) {
      hours = hours - 12;
    }
    // canvas.rotate(this.hours >= 12
    //     ? 2 * 3.14 * ((this.hours - 12) / 12 + (this.minutes / 720))
    //     : 2 * 3.14 * ((this.hours / 12) + (this.minutes / 720)));
    // Path path = new Path();
    canvas.rotate((this.hours * 30 * 3.14 + this.minutes * 0.5 * 3.14) / 180);
    // canvas.rotate(30 * 3.14 / 180);
    Path p = Path();
    p.moveTo(0, 0);
    p.lineTo(0, -85);
    Paint pl = Paint();
    pl.style = PaintingStyle.stroke;
    pl.color = Colors.black;
    pl.strokeWidth = 15.0;

    pl.strokeCap = StrokeCap.values[1];

    canvas.drawPath(p, pl);

    //heart shape head for the hour hand
    // path.moveTo(0.0, 0.0);
    // path.lineTo(0.0, 10);

    // canvas.drawPath(path, hourHandPaint);
    // canvas.drawShadow(path, Colors.black, 2.0, false);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
