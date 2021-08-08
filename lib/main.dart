import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'functions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
  void checkAnswer(bool chosenAnswer) {
    bool correctAnswer = quizBrain.getQuestionAns();
    int numberOfQuestions = quizBrain.getQuestionlength();
    if (scoreKeeper.length != numberOfQuestions) {
      if (chosenAnswer == correctAnswer) {
        scoreKeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        scoreKeeper.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }
      if (quizBrain.isFinished()) {
        Alert(
          context: context,
          title: "End of Quiz",
          desc: "You had 20 points",
          buttons: [
            DialogButton(
              color: Colors.red,
              child: Text(
                "QUIT",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                SystemNavigator.pop();
              },
              width: 120,
            ),
            DialogButton(
              child: Text(
                "START AGAIN",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {},
              width: 120,
            )
          ],
        ).show();
      }
      setState(
        () {
          quizBrain.nextQuestion();
        },
      );
    }
  }

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
                  checkAnswer(true);
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
                  checkAnswer(false);
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
