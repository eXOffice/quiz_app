import 'package:quiz_app/question.dart';

class QuizBrain {
  int _qNum = 0;
  List<Question> _questionBank = [
    Question(q: 'grass is red', a: false),
    Question(q: 'Sky is Blue', a: true),
    Question(q: 'we all are run for money', a: true),
  ];

  List<Question> sportsQuestionBank = <Question>[
    Question(q: 'Cricket is Most familiar game', a: true),
    Question(q: 'added women in cricket now', a: true),
    Question(
        q: 'football is most popular game till now from the beginning',
        a: true),
  ];

  void nextQuestion() {
    if (_qNum < _questionBank.length - 1) {
      _qNum++;
    } else {
      _qNum = 0;
    }
  }

  String? getQuestionText() {
    return _questionBank[_qNum].qText;
  }

  bool? getAnsText() {
    return _questionBank[_qNum].qAns;
  }
}
