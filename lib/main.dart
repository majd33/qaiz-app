import 'package:flutter/material.dart';
import 'package:my_quiz/quiz.dart';
import 'package:my_quiz/result.dart';
import 'allQ.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz Application',
      theme: ThemeData(primaryColor: Colors.blueGrey[500]),
      home: MyHomePage(title: 'Quiz App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

Color myTheme, myTextTheme;

class _MyHomePageState extends State<MyHomePage> {
  int _score = 0;
  int _questionIndix = 0;
  var _mylistScore = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  int indix = 0;
  int lastScore = 0;
  bool isSwitched = false;
  int start = 0;

  void restart() {
    setState(() {
      _questionIndix = 0;
      lastScore = 0;
    });
    _score = 0;
    _mylistScore.clear();
    _mylistScore = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  }

  void answerOfQuestion(int score) {
    _mylistScore[_questionIndix] = score;
    print("$_mylistScore");
    setState(() {
      lastScore = score;
      _score += score;
      if (_questionIndix < questions.length) _questionIndix++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title,
              style: TextStyle(color: Colors.white, fontSize: 20)),
          actions: [
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                  if (isSwitched == true) {
                    myTheme = Colors.blueGrey[900];
                    myTextTheme = Colors.white;
                  }
                  if (isSwitched == false) {
                    myTheme = Colors.white;
                    myTextTheme = Colors.black;
                  }
                });
              },
              inactiveThumbColor: Colors.blueGrey[900],
              inactiveTrackColor: Colors.blueGrey[900],
              activeColor: Colors.white,
            ),
          ],
        ),
        body: Container(
            color: myTheme,
            width: double.infinity,
            child: start == 0
                ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("You Are Welcome !",
                      style: TextStyle(fontSize: 50, color: myTextTheme), textAlign: TextAlign.center,),
                  SizedBox(
                    height: 50,
                  ),
                  RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                      color: Colors.blueGrey[500],
                      child: Text(
                        "Start",
                        style:
                        TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      onPressed: () {
                        setState(() {
                          start = 1;
                        });
                      })],
              ),
            )
                : _questionIndix < questions.length
                ? quiz(questions, _questionIndix, answerOfQuestion)
                : result(restart, _score)),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blueGrey[500],
            onPressed: () {
              setState(() {
                if (_questionIndix != 0) {
                  _questionIndix--;
                  _score = _score - _mylistScore[_questionIndix];
                  _mylistScore[_questionIndix] = 0;
                  print("$_mylistScore");
                }
              });
            },
            child: Icon(Icons.arrow_back_sharp)));
  }
}
