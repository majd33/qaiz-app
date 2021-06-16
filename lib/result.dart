import 'package:flutter/material.dart';
import 'main.dart';

class result extends StatelessWidget {
  final Function restart;
  final int myscore;

  result(this.restart, this.myscore);

  String get myresult {
    String myResultText;
    if (myscore >= 5)
      myResultText = "Sucsses";
    else if (myscore < 5) myResultText = "Faild";
    return myResultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(myresult,
                style: TextStyle(
                    fontSize: 40, fontWeight: FontWeight.bold, color: myTextTheme)),
            SizedBox(height: 10),
            Text("Your Score $myscore / 10",
                style: TextStyle(
                    fontSize: 25, fontWeight: FontWeight.bold, color: myTextTheme)),
            SizedBox(
              height: 25,
            ),
            FlatButton(
              onPressed: restart,
              child: Text(
                "Restart",
                style: TextStyle(color: Colors.blueGrey[500], fontSize: 20),
              ),
            )
          ],
        ));
  }
}
