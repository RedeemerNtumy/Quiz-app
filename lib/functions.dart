import 'questions.dart';

class Functions {
  int _questionNumber = 0;
  List<Question> _questions = [
    Question(
        question: "The CPU is responsible for executing instructions for the Computer",
        answer: true),
    Question(
        question: "Main memory is a place where the programs and data are stored temporarily during processing",
        answer: true),
    Question(
        question: "Pseudo-code uses exact programming language syntax to represent a module in the larger program",
        answer: false),
    Question(
        question: "Secondary storage,similar to main memory,also stores programs and data",
        answer: true),
    Question(
        question: "Writing Code is the first step in the waterfall model of developing software",
        answer: false)
  ];
  void nextQuestion() {
    if (_questionNumber < _questions.length - 1) {
      _questionNumber++;
    }
  }

  int getQuestionlength() {
    return _questions.length;
  }

  String getQuestionText() {
    return _questions[_questionNumber].question;
  }

  bool getQuestionAns() {
    return _questions[_questionNumber].answer;
  }

  void reset() {
    _questionNumber = 0;
  }

  bool isFinished() {
    bool answer;
    if (_questions.length == _questionNumber + 1) {
      answer = true;
    } else {
      answer = false;
    }
    return answer;
  }
}
