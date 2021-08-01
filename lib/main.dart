import 'package:flutter/material.dart';
import 'questions.dart';

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
  
  List<Question> questions = [
    Question(q:"The CPU is responsible for executing instructions for the Computer",a:true),
    Question(q:"Main memory is a place where the programs and data are stored temporarily during processing",a:true),
    Question(q:"Pseudo-code uses exact programming language syntax to represent a module in the larger program",a:false),
    Question(q:"Secondary storage,similar to main memory,also stores programs and data",a:true),
    Question(q:"Writing Code is the first step in the waterfall model of developing software",a:false)
  ];
  int questionNumber = 0;
  List<bool> answers = [true, true, false, true, false];
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
                questions[questionNumber],
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
                  bool correctAnswer = answers[questionNumber];
                  if (correctAnswer == true) {}
                  setState(() {
                    questionNumber++;
                    if (questionNumber == 5) {
                      questionNumber = 0;
                    }
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
                  bool correctAnswer = answers[questionNumber];
                  if (correctAnswer == false) {}
                  setState(() {
                    questionNumber++;
                    if (questionNumber == 5) {
                      questionNumber = 0;
                    }
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
