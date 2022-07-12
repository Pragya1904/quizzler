import 'package:flutter/material.dart';
import 'brain.dart';

Brain brain=Brain();
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
                  if (brain.getAnswer() == true) {
                    correct();
                  } else {
                    wrong();
                  }
                  brain.next();

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
                  if (brain.getAnswer() == false) {
                    correct();
                  } else {
                    wrong();
                  }
                  brain.next();
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

  void correct() {
    print('correct answer');
    setState(() {
      score.add(Icon(Icons.check, color: Colors.green));
    });
  }

  void wrong() {
    print('wrong answer');
    setState(() {
      score.add(Icon(Icons.close, color: Colors.red));
    });

  }
}
