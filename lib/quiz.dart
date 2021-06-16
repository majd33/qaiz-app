//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

class quiz extends StatelessWidget {
  final List<Map<String, Object>> question1;
  final int questionIndix1;
  final Function answerQuestion1;

  quiz(this.question1, this.questionIndix1, this.answerQuestion1);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50),
        question(question1[questionIndix1]['q'],questionIndix1),
        SizedBox(height: 50),
        ...(question1[questionIndix1]['answers'] as List<Map<String, Object>>)
            .map((myanswer) {
          return answer(
              myanswer['text'], () =>answerQuestion1(myanswer['score']));
        }).toList(),
      ],
    );
  }
}
