import 'package:quiz/question.dart';
import 'package:quiz/main.dart';

class Brain {
  int _count = 0;
  List<Question> _qna = [
    Question('1 is smaller than 2', true),
    Question('developer is pragya', true),
    Question('6am is evening', false),
  ];
  void next() {
    if (_count <=_qna.length -1) {
      _count++;
    }
  }
  int NoOfQuestions()
  {
    return _qna.length;
  }
  String getQuestion() {
    return _qna[_count].question;
  }

  bool getAnswer() {
    return _qna[_count].answer;
  }

  bool isFinished() {
    if (_count >= _qna.length-1)
      return true;
    else
      return false;
  }
  void reset(){
    _count=0;
  }
}
