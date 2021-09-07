import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultscore;
  final Function resethandler;

  Result(this.resultscore, this.resethandler);

  String get resultphrase {
    String resultText;
    if (resultscore < 6) {
      resultText = 'Answer all question ';
    } else if (resultscore <= 15) {
      resultText = 'You Need To Change ';
    } else if (resultscore <= 10) {
      resultText = "You Are Much Better";
    } else if (resultscore <= 30) {
      resultText = "You Are Better";
    } else if (resultscore <= 40) {
      resultText = "You Are Great";
    } else if (resultscore <= 50) {
      resultText = "You Are A Gentlmen";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(0),
            height: 100,
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
              resultphrase,
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            child: Padding(
                padding: EdgeInsets.only(top: 35),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.greenAccent),
                  ),
                  child:
                      Text('Restart Quiz !', style: TextStyle(fontSize: (24))),
                  onPressed: resethandler,
                )),
          )
        ],
      ),
    );
  }
}
