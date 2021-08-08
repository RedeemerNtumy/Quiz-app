import 'package:flutter/material.dart';
import 'functions.dart';

Functions quizBrain = Functions();

void main() {
  runApp(Quiz());
}

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          title: Center(
            child: Text("Brainy"),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: QuizMain(),
          ),
        ),
      ),
    );
  }
}

class QuizMain extends StatefulWidget {
  @override
  _QuizMainState createState() => _QuizMainState();
}

class _QuizMainState extends State<QuizMain> {
  List<Icon> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              color: Colors.green,
              child: TextButton(
                style: ButtonStyle(),
                onPressed: () {
                  bool correctAnswer = quizBrain.getQuestionAns();
                  if (correctAnswer == true) {}
                  setState(() {
                    quizBrain.nextQuestion();
                  });
                },
                child: Text(
                  "True",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              color: Colors.red,
              child: TextButton(
                onPressed: () {
                  bool correctAnswer = quizBrain.getQuestionAns();
                  if (correctAnswer == false) {}
                  setState(() {
                    quizBrain.nextQuestion();
                  });
                },
                child: Text(
                  "False",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
