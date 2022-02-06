import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  const Question({required this.question});
  final String? question;

  @override
  Widget build(BuildContext context) {
    return Text(
      question!,
      style: TextStyle(fontSize: 28),
    );
  }
}
