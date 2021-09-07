import 'package:circular_countdown_timer/circular_countdown_timer.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// ignore: must_be_immutable
class TimerCount extends StatelessWidget {
  //CountDownController _controller = CountDownController();

  final Function nexthandler;

  TimerCount({@required this.nexthandler});

  int duration = 15;
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.black,
      child: CircularCountDownTimer(
        key: UniqueKey(),
        width: 170,
        height: 10,
        duration: duration,
        fillColor: Colors.green,
        color: Colors.white,
        //controller: _controller,
        backgroundColor: Colors.white54,
        strokeWidth: 10.0,
        strokeCap: StrokeCap.round,
        isTimerTextShown: true,
        isReverse: false,
        autoStart: true,
        onComplete: () {
          nexthandler();

          //answerquestion();
          //setState(() {
          //min--;
          //});
          //Answer.selecthandler();
          // Alert(
          //         context: context,
          //         title: 'Done',
          //         style: AlertStyle(
          //           isCloseButton: true,
          //           isButtonVisible: false,
          //           titleStyle: TextStyle(
          //             color: Colors.black,
          //             fontSize: 10.0,
          //           ),
          //         ),
          //         type: AlertType.success)
          //     .show();
        },
        textStyle: TextStyle(fontSize: 60.0, color: Colors.black),
      ),
    );
  }
}
