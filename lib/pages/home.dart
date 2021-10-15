import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myclock/widgets/clockdesign.dart';
import 'package:myclock/widgets/clockuper.dart';
import 'package:myclock/widgets/hand_hour.dart';
import 'package:myclock/widgets/handsecond.dart';
import 'package:myclock/widgets/minate.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DateTime dateTime;
  late Timer _timer;
  void initState() {
    super.initState();
    dateTime = new DateTime.now();
    _timer = new Timer.periodic(const Duration(seconds: 1), setTime);
  }

  void setTime(Timer timer) {
    setState(() {
      dateTime = new DateTime.now();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 1.0,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 10.0,
                                ),
                              ]),
                          child: CustomPaint(
                            painter: ClockDesign(),
                          )),
                    ),
                  ),
                  AspectRatio(
                    aspectRatio: 1.0,
                    child: Container(
                      child: CustomPaint(
                        painter: ClockUper(),
                      ),
                    ),
                  ),
                  AspectRatio(
                    aspectRatio: 1.0,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: CustomPaint(
                          painter:
                              ClockDialPainter(clockText: "Times Know Roman"),
                        ),
                      ),
                    ),
                  ),
                  AspectRatio(
                    aspectRatio: 1.0,
                    child: Container(
                        child: CustomPaint(
                      painter: Handhour(
                          hours: dateTime.hour, minutes: dateTime.minute),
                    )),
                  ),
                  AspectRatio(
                    aspectRatio: 1.0,
                    child: Container(
                        child: CustomPaint(
                      painter: Handmin(minater: dateTime.minute),
                    )),
                  ),
                  AspectRatio(
                    aspectRatio: 1.0,
                    child: Container(
                        child: CustomPaint(
                      painter: HandSecond(s: dateTime.second),
                    )),
                  ),
                  AspectRatio(
                    aspectRatio: 1.0,
                    child: Container(
                        child: CustomPaint(
                      painter: DotC(),
                    )),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 200,
                      height: 50,
                      color: Colors.white,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${dateTime.hour} : ${(dateTime.minute < 10) ? "0${dateTime.minute}" : "${dateTime.minute}"} : ${(dateTime.second < 10) ? "0${dateTime.second}" : "${dateTime.second}"}",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DotC extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var radius = size.width / 2;
    canvas.save();
    canvas.translate(radius, radius);
    Paint paint = Paint();
    paint.color = Colors.grey;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 10.0;
    canvas.drawCircle(
      Offset(0, 0),
      10.0,
      paint,
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class ClockDialPainter extends CustomPainter {
  final clocktext;

  ClockDialPainter({this.clocktext, required String clockText});
  @override
  List l = [
    "12",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
  ];
  List romanNumeralList = [
    'XII',
    'I',
    'II',
    'III',
    'IV',
    'V',
    'VI',
    'VII',
    'VIII',
    'IX',
    'X',
    'XI'
  ];

  void paint(Canvas canvas, Size size) {
    var radius = size.width / 2;
    canvas.save();
    canvas.translate(radius, radius);
    centerpoint(canvas, radius);
    for (var i in l) {
      canvas.save();
      canvas.translate(
        0.0,
        (-radius + 20),
      );

      TextSpan span = new TextSpan(
          style: new TextStyle(
              color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold),
          text: "$i");
      TextPainter tp = new TextPainter(
          text: span,
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr);
      var ik = int.parse(i);
      canvas.rotate(-(30 * ik * 3.14 / 180));

      tp.layout();

      tp.paint(canvas, new Offset(-10.0, -10.0));

      canvas.restore();
      canvas.rotate(30 * 3.14 / 180);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

void centerpoint(canvas, radius) {
  var c = Offset(0.0, 0.0);
  var r = 10.0;
  Paint paint = Paint();
  paint.color = Colors.black;
  paint.style = PaintingStyle.fill;
  canvas.drawCircle(c, r, paint);
}

  // Path p = Path();
  //     p.moveTo(0, 0);
  //     p.lineTo(0, 100);
  //     Paint pl = Paint();
  //     pl.style = PaintingStyle.stroke;
  //     pl.color = Colors.black;
  //     canvas.drawPath(p, pl);
