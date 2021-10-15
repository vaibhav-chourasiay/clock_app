import 'package:flutter/material.dart';

class ClockDesign extends CustomPainter {
  void Mydraw(canvas, radius) {
    // new origen means 0,0
    // styleing for line(stands)
    Paint l = Paint();
    l.style = PaintingStyle.stroke;
    l.color = Colors.black87;
    l.strokeCap = StrokeCap.round;
    l.strokeWidth = 15.0;

    var p1 = Offset(0, -radius - 20);
    var p2 = Offset(0, radius + 20);
    canvas.drawLine(p1, p2, l);

    //draw bell
    //style
    Paint b = Paint();
    b.style = PaintingStyle.fill;
    b.color = Colors.black87;

    Path carve = Path();
    carve.moveTo(-50.0, -radius - 20);
    carve.lineTo(50.0, -radius - 20);
    carve.quadraticBezierTo(0.0, -radius - 100, -50.0, -radius - 20);
    canvas.drawPath(carve, b);
  }

  @override
  void paint(Canvas canvas, Size size) {
    var radius = size.width / 2;
    canvas.save();
    canvas.translate(radius, radius);
    // creating a function for leg and head;
    canvas.rotate(2 * 3.14 / 12);

    Mydraw(canvas, radius);
    canvas.rotate(-4 * 3.14 / 12);

    Mydraw(canvas, radius);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
