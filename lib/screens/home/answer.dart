import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  List<String> answers = [];
  var func;
  Answer(this.answers, this.func);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: answers.map((item) {
        return Container(
          child: ElevatedButton(
            onPressed: () {
              func(item);
            },
            child: Text(item),
          ),
          width: double.infinity,
          margin: EdgeInsets.all(10),
        );
      }).toList(),
    );
  }
}
