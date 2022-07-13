import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'brain.dart';

Brain brain = Brain();
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Quiz(),
  ));
}

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<Icon> score = [];
  void check(bool userAns)
  {
    bool correct=brain.getAnswer();
    setState(() {
      if (brain.isFinished() == true) {
        Alert(
          context: context,
          type: AlertType.error,
          title: "FINISHED",
          desc: "You have reached the end of the quiz",
        ).show();
        sleep(Duration(seconds: 5));
        brain.reset();
        score = [];
      } else
      {if (userAns == correct)
        score.add(Icon(Icons.check, color: Colors.green));
      else
        score.add(Icon(Icons.close, color: Colors.red));
      brain.next();}

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Center(
                child: Text(
              brain.getQuestion(),
              style: TextStyle(color: Colors.white),
            )),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  check(true);
                },
                child: Text(
                  "True",
                  style: TextStyle(color: Colors.white),
                )),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  check(false);
                },
                child: Text(
                  "False",
                  style: TextStyle(color: Colors.white),
                )),
          ),
          //Todo: adding a todo is helpful...acts like a bookmark too :)
          Row(
            children: score,
          )
        ],
      ),
    );
  }
}
