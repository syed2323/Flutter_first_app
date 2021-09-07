import 'package:flutter/material.dart';
import './timer.dart';

class Answer extends StatelessWidget {
  final Function selecthandler;
  final String answertext;

  Answer(this.selecthandler, this.answertext);

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   //color: Colors.orange,
    //   margin: const EdgeInsets.only(top: 40.0),

    //child:
    return Container(
      margin: new EdgeInsets.all(8.0),
      //color: Colors.blue,
      child: Row(children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: RaisedButton(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Color.fromRGBO(49, 156, 22, 1))),
              splashColor: Colors.lightGreen,
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 17.0),
              elevation: 10.0,
              highlightElevation: 5.0,
              child: Text(
                answertext,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                TimerCount(
                  nexthandler: null,
                );
                selecthandler();

                //new TimerCount();
              },
            ),
          ),
        )
      ]),
    );
  }
}
