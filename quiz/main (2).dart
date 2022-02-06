import 'package:flutter/material.dart';
import 'package:flutter_demo_project/answer.dart';
import './question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var questionIndex = 0;
  var questions = [
    "What is your fav color?",
    "What is your fav food?",
  ];
  var answers = [
    ["Red", "Blue", "Green"],
    ["Pizza", "Biryani", "Air", "abcd"],
  ];
  var correct_answer = ["Blue", "Air"];
  var user_answers = [];
  void answerQuestion(String item) {
    setState(() {
      user_answers.add(item);
      print(user_answers);
      questionIndex += 1;
    });
  }

  Widget calculateResult(givenAnswers) {
    int score = 0;
    int totalScore = 0;
    for (String answer in givenAnswers) {
      if (correct_answer.contains(answer)) {
        score += 5;
      }
      totalScore += 5;
    }
    return Text(
      "Your Score Is $score Out Of $totalScore!!!",
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  var controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  late var textFields = [
    TextField(
      controller: controllers[2],
      decoration: InputDecoration(
        labelText: "Enter Answer 1",
        hintText: "Answer",
      ),
    ),
    TextField(
      controller: controllers[3],
      decoration: InputDecoration(
        labelText: "Enter Answer 2",
        hintText: "Answer",
      ),
    )
  ];
  var answerCount = 2;
  void addQuestion(context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            child: Column(
              children: [
                Text("Add Question"),
                TextField(
                  controller: controllers[0],
                  decoration: InputDecoration(
                    labelText: "Enter Question",
                    hintText: "Question",
                  ),
                ),
                for (var item in textFields) item,
                TextField(
                  controller: controllers[1],
                  decoration: InputDecoration(
                    labelText: "Correct Answer",
                    hintText: "Answer",
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {
                        questions.add(controllers[0].text);
                        List<String> ans = [];
                        for (var i = 2; i < controllers.length; i++) {
                          ans.add(controllers[i].text);
                        }
                        answers.add(ans);
                        correct_answer.add(controllers[1].text);
                        for (var item in controllers) {
                          item.clear();
                        }
                        Navigator.pop(context);
                      },
                      child: Text("Submit"),
                    )),
                ElevatedButton(
                  onPressed: () {
                    answerCount++;
                    controllers.add(TextEditingController());
                    textFields.add(
                      TextField(
                        controller: controllers[controllers.length - 1],
                        decoration: InputDecoration(
                          labelText: "Enter Answer $answerCount",
                          hintText: "Answer",
                        ),
                      ),
                    );
                    Navigator.pop(context);
                    addQuestion(context);
                  },
                  child: Text("Add More Answers"),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello World"),
        ),
        body: (questionIndex < questions.length)
            ? Center(
                child: Column(
                  children: [
                    Question(question: questions[questionIndex]),
                    Answer(answers[questionIndex], answerQuestion)
                  ],
                ),
              )
            : Center(
                child: calculateResult(user_answers),
              ),
        floatingActionButton: (questionIndex > 0)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        questionIndex = 0;
                        user_answers.clear();
                      });
                    },
                    child: Icon(Icons.refresh),
                  ),
                  Builder(builder: (context) {
                    return FloatingActionButton(
                      onPressed: () {
                        addQuestion(context);
                      },
                      child: Icon(Icons.add),
                    );
                  }),
                ],
              )
            : Builder(builder: (context) {
                return FloatingActionButton(
                  onPressed: () {
                    addQuestion(context);
                  },
                  child: Icon(Icons.add),
                );
              }),
      ),
    );
  }
}
