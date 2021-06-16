import 'package:flutter/material.dart';

class answer extends StatelessWidget {
  final String answerText;
  final Function answerFunction;

  answer(this.answerText, this.answerFunction);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(15),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        color: Colors.blueGrey[500],
        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
        child: Text(
          answerText,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        onPressed: answerFunction,
      ),
    );
  }
}
