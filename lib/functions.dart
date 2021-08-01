import 'questions.dart';

class Functions {
  List<Question> _questions = [
    Question(
        q: "The CPU is responsible for executing instructions for the Computer",
        a: true),
    Question(
        q: "Main memory is a place where the programs and data are stored temporarily during processing",
        a: true),
    Question(
        q: "Pseudo-code uses exact programming language syntax to represent a module in the larger program",
        a: false),
    Question(
        q: "Secondary storage,similar to main memory,also stores programs and data",
        a: true),
    Question(
        q: "Writing Code is the first step in the waterfall model of developing software",
        a: false)
  ];
  String getQuestionText(int questionNumber) {
    return _questions[questionNumber].question;
  }

  bool getQuestionAns(int questionNumber) {
    return _questions[questionNumber].answer;
  }
}
