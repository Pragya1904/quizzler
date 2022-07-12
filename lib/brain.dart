
import 'package:quiz/question.dart';
class Brain {
  int _count = 0;
  List<Question> _qna = [
    Question('The developer\'s mentor\'s name is harshit', true),
    Question('background is white', false),
    Question('developer is Pragya', true),
  ];
  void next(){
    if(_count<_qna.length-1)
      _count++;
  }

  String getQuestion() {
    return _qna[_count].question;
  }
  bool getAnswer(){
    return _qna[_count].answer;
  }
}