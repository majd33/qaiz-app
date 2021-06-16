import 'package:flutter/material.dart';
import 'main.dart';

class question extends StatelessWidget {
  final String questionText;
  final int indix ;

  question(this.questionText, this.indix);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        "${indix+1}. $questionText",
        style: TextStyle(fontSize: 25, color: myTextTheme),
        textAlign: TextAlign.center,
      ),
    );
  }
}
