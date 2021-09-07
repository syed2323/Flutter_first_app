import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
//import './timer.dart';

// ignore: must_be_immutable
class Quiz extends StatelessWidget {
  final List<Map<String, Object>> question;
  final int questionindex;
  final Function answerquestion;

  var child;

  Quiz(
      {@required this.question,
      @required this.answerquestion,
      @required this.questionindex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Question(
            (question[questionindex]['questiontext']),
          ),
          Container(
            padding: EdgeInsets.only(top: 30),
            //color: Colors.black,
            height: 270,
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                childAspectRatio: 1 / 0.5,
                mainAxisSpacing: 0,
              ),
              // children:
              // return Question(() => (question[questionindex]['questiontext']),
              // );

              // itemCount: 300,
              // // ignore: missing_return
              // itemBuilder: (BuildContext context, int index) {
              //   return Container();
              // }

              children: (question[questionindex]['answer']
                      as List<Map<String, Object>>)
                  .map((answer) {
                return Answer(
                    () => answerquestion(answer['score']), answer['text']);
              }).toList(),

              // ignore: unnecessary_statements
              // (Question
              // (
              //   question[questionindex]['questiontext']
              //   )),
              // ...(question[questionindex]['answer'] as List<Map<String, Object>>)
              //      .map((answer)
              //      {
              //    return Answer(() => answerquestion(answer['score']), answer['text']);
              //  }).toList()
            ),
          ),
        ],
      ),
    );
  }
}
