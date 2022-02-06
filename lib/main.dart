import 'package:flutter/material.dart';
import 'package:flutter_demo_project/screens/home/quiz.dart';
import 'package:flutter_demo_project/screens/wrapper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Wrapper(),
    );
  }
}
