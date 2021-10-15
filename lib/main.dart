import 'package:flutter/material.dart';
import 'package:myclock/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Clock",
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      routes: {
        "/": (context) => HomePage(),
      },
    );
  }
}
