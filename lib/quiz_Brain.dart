import 'package:quiz_app/question.dart';
import 'package:quiz_app/showCorrectAnsQ.dart';

class QuizBrain {
  int _qNum = 0;
  List<Question> _questionBank = [
    Question(q: 'grass is red', a: false),
    Question(q: 'Sky is Blue', a: true),
    Question(q: 'we all are run for money', a: true),
    Question(q: 'রাস্ত্রপতির নাম=> শিরিন ফারহানা', a: false),
  ];

  List<ShowCorrectAnsQ> _questionBank2 = [
    ShowCorrectAnsQ(
        q: 'যুক্তরাষ্ট্রের প্রেসিডেন্ট বারাক অবামা ',
        a: false,
        showAns: 'ুক্তরাষ্ট্রের প্রেসিডেন্ট ডোনাল্ড ট্রাম্প '),
    ShowCorrectAnsQ(
        q: 'ভারতের রাজধানী মুম্বাই',
        a: false,
        showAns: 'ভারতের রাজধানী নয়া দিল্লি'),
  ];

  List<Question> sportsQuestionBank = <Question>[
    Question(q: 'Cricket is Most familiar game', a: true),
    Question(q: 'added women in cricket now', a: true),
    Question(
        q: 'football is most popular game till now from the beginning',
        a: true),
  ];

  // void nextQuestion() {
  //   if (_qNum < _questionBank2.length - 1) {
  //     _qNum++;
  //   } else {
  //     _qNum = 0;
  //   }
  // }

  void nextQuestion() {
    if (_qNum < _questionBank.length - 1) {
      _qNum++;
    } else {
      _qNum = 0;
    }
  }

  // String? getQuestionText() {
  //   return _questionBank2[_qNum].qText;
  // }

  String? getQuestionText() {
    return _questionBank[_qNum].qText;
  }

  bool? getAnsText() {
    return _questionBank[_qNum].qAns;
  }

  // bool? getAnsText() {
  //   return _questionBank2[_qNum].ansText;
  // }

  String? getCorrectAnsText2() {
    return _questionBank2[_qNum].showA;
  }
}
