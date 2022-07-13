import 'package:quiz/question.dart';
import 'package:quiz/main.dart';

class Brain {
  int _count = 0;
  List<Question> _qna = [
    Question('Kushagra  is annoying', true),
    Question('Kushagra loves ice-cream more than anyone else', true),
    Question('Kushagra loves his HOD', false),
  ];
  void next() {
    if (_count <=_qna.length -1) {
      _count++;
    }
  }

  String getQuestion() {
    return _qna[_count].question;
  }

  bool getAnswer() {
    return _qna[_count].answer;
  }

  bool isFinished() {
    if (_count > _qna.length-1)
      return true;
    else
      return false;
  }
  void reset(){
    _count=0;
  }
}
