import 'package:flutter/material.dart';
// import 'package:quiz_app/question.dart';
import 'package:quiz_app/quiz_Brain.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(Quiz());
}

class Quiz extends StatelessWidget {
  Quiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  //const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> Store = [];

  QuizBrain quizBrain = QuizBrain();

  void checkAnswer(bool userPickedAns) {
    bool correctAns = quizBrain.getAnsText() ?? true;

    setState(
      () {
        if (quizBrain.isFinished() == true) {
          Alert(
            context: context,
            title: 'Finished',
            desc: 'You\'ve Reached the end of Quiz',
          ).show();
          quizBrain.reset();
          Store = [];
        } else {
          if (userPickedAns == correctAns) {
            Store.add(
              Icon(
                Icons.check,
                color: Colors.green,
              ),
            );
          } else {
            Store.add(
              Icon(
                Icons.close,
                color: Colors.red,
              ),
            );
          }
          quizBrain.nextQuestion();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              quizBrain.getQuestionText() ?? '',
              textAlign: TextAlign.center,
              style: (TextStyle(
                fontSize: 25.0,
                color: Colors.white,
              )),
            ),
          ),
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                checkAnswer(true);
              },
              child: Text('True'),
            ),
          ),
        ),

        // Expanded(
        //   //flex: 5,
        //   child: Center(
        //     child: Text(
        //       quizBrain.getCorrectAnsText2() ?? 'Ans is here',
        //       textAlign: TextAlign.center,
        //       style: (TextStyle(
        //         fontSize: 25.0,
        //         color: Colors.white,
        //       )),
        //     ),
        //   ),
        // ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                //padding: EdgeInsets.all(15),
              ),
              onPressed: () {
                checkAnswer(false);
              },
              child: Text('False'),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: Store),
        )
      ],
    );
  }
}
