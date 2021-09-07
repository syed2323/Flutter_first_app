//import 'dart:ffi';

import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';
import './timer.dart';
//import './answer.dart';

//void main() {
//runApp(MyApp());
//}
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class MyApp1 extends StatefulWidget {
  @override
  _MyAppstate createState() => _MyAppstate();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Personality Detector'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 20),
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: Text(
                  'Want To Check Your Personality?Click On Start Button',
                  style: TextStyle(fontSize: 35),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                  child: Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.greenAccent),
                          ),
                          child: Text('Start........',
                              style: TextStyle(fontSize: (44))),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MyApp1()),
                            );
                          })))
            ],
          ),
        )
        //  Center(
        //   child: RaisedButton(
        //     child: Text('Go to Second Screen'),
        //     onPressed: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(builder: (context) => MyApp1()),
        //       );
        //     },
        //   ),
        // ),
        );
  }
}

class _MyAppstate extends State<MyApp1> {
  final _question = [
    {
      'questiontext': 'what is your favorite color?',
      'answer': [
        {'text': 'black', 'score': 10},
        {'text': 'red', 'score': 2},
        {'text': 'orange', 'score': 6},
        {'text': 'green ', 'score': 8}
      ],
    },
    {
      'questiontext': 'what is your favorite animal? ',
      'answer': [
        {'text': 'rabitt', 'score': 10},
        {'text': 'dog', 'score': 8},
        {'text': 'lion', 'score': 1},
        {'text': 'tiger', 'score': 2}
      ],
    },
    {
      'questiontext': 'What stuff do you wish to bring with you?',
      'answer': [
        {'text': 'watch', 'score': 10},
        {'text': 'gun', 'score': 1},
        {'text': 'wrist chain', 'score': 3},
        {'text': 'ring', 'score': 7}
      ],
    },
    {
      'questiontext': 'what dress do you want to wear  for presentation?',
      'answer': [
        {'text': '3 piece Suit', 'score': 10},
        {'text': 'Short & T-shirt', 'score': 1},
        {'text': 'Formal dress', 'score': 6},
        {'text': 'jeans ', 'score': 6}
      ],
    },
    {
      'questiontext': 'How do you feel about assisting others? ',
      'answer': [
        {'text': 'yes,always there', 'score': 10},
        {'text': 'No i dont like', 'score': 2},
        {'text': 'may be', 'score': 8},
        {'text': 'never ', 'score': 1}
      ],
    },
  ];
  var questionindex = 0;
  var _totalScore = 0;
  var durationn = 0;

  void nextquestion() {
    setState(() {
      if (questionindex < _question.length) {
        questionindex = questionindex + 1;
      }
    });
  }

  void resetTimer() {
    setState(() {
      durationn = 0;
    });
  }

  void _resetquiz() {
    setState(() {
      questionindex = 0;
      _totalScore = 0;
    });
  }

  void _answerquestion(int score) {
    _totalScore = _totalScore += score;
    setState(() {
      questionindex = questionindex + 1;
    });
    print(questionindex);
    if (questionindex < _question.length) {
      print('there is mmore questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Personality Detector'),
            backgroundColor: Colors.green,
            // automaticallyImplyLeading: true,
            //`true` if you want Flutter to automatically add Back Button when needed,
            //or `false` if you want to force your own back button every where
            // leading: IconButton(
            //   icon: Icon(Icons.arrow_back),
            //   //onPressed:() => Navigator.pop(context, false),
            //   onPressed: () {
            //     MyHomePage();
            //   },
            // )
          ),
          body: Column(children: <Widget>[
            Container(
                padding: EdgeInsets.only(top: 40),
                //color: Colors.blue,
                height: 190,
                width: 500,
                child: questionindex < _question.length
                    ? TimerCount(nexthandler: nextquestion)
                    : Container(
                        child: Image(
                          image: AssetImage('assets/eed.png'),
                        ),
                      )),
            Container(
              padding: EdgeInsets.only(top: 50),
              height: 400,
              child: questionindex < _question.length
                  ? Quiz(
                      answerquestion: _answerquestion,
                      question: _question,
                      questionindex: questionindex,
                    )
                  : Result(_totalScore, _resetquiz),
            ),
          ])
          //  questionindex < _question.length
          //     ? Quiz(
          //         answerquestion: _answerquestion,
          //         question: _question,
          //         questionindex: questionindex,
          //       )
          //     : Result(_totalScore, _resetquiz),
          ),
    );
  }
}
