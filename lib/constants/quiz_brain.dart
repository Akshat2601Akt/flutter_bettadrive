import '../constants/questions.dart';

class QuizBrain {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question('When near a pedestrian crossing, as the pedestrians are waiting to cross the road, what should you do?', 'Sound horn and proceed', 'Slow down, sound horn and pass', 'Stop the vehicle and wait till the pedestrians cross the road and then proceed', 'Stop the vehicle and wait till the pedestrians cross the road and then proceed'),
    Question('When a vehicle is involved in an accident causing injury to any person, what should you do?', 'Take the vehicle to the nearest police station and report the accident', 'Stop the vehicle and report to the police station', 'Take all reasonable steps to secure medical attention to the injured and report to the nearest police station within 24 hours', 'Take all reasonable steps to secure medical attention to the injured and report to the nearest police station within 24 hours'),
    Question('When a blind person is crossing the road holding a white cane, the driver should: ', 'Consider the white cane as a traffic sign to stop the vehicle', 'Blow the horn and proceed', 'Slow down and proceed with caution', 'Consider the white cane as a traffic sign to stop the vehicle'),
    Question('When you reach an intersection where there is no signal light or a traffic police man, you should:', 'Give way to traffic approaching the intersection from other roads', 'Give proper signal, sound the horn and then proceed', 'Give way to the traffic approaching the intersection on your right side and proceed after giving necessary signals', 'Give way to the traffic approaching the intersection on your right side and proceed after giving necessary signals'),
    Question('You are waiting at a T-Junction. A vehicle is coming from the left with right signal flashing. What should you do', 'Wait until the vehicle turns to the right side', 'Accelerate and move forward', 'Move ahead slowly', 'Wait until the vehicle turns to the right side'),
    Question('You are approaching a narrow bridge, another vehicle is about to enter the bridge from the opposite side. You should:', 'Increase the speed and try to cross the bridge as fast as possible', 'Put on the head light and pass the bridge', 'Wait till the other vehicle crosses the bridge and then proceed', 'Wait till the other vehicle crosses the bridge and then proceed'),
    Question('When a vehicle approaches an unguarded railway level crossing, before crossing it, the driver shall:', 'Stop the vehicle on the left side of the road, get down, go to the railway track, and ensure that no train is coming from either side', 'Sound horn and cross the track as fast as possible', 'Wait till the train passes','Stop the vehicle on the left side of the road, get down, go to the railway track, and ensure that no train is coming from either side'),
    Question('While you are driving with the headlight in high beam during night, a vehicle approaches from opposite direction, you will:', 'Proceed keeping to the left', 'Put the headlight in dim and bright alternatively several times', 'Dim the headlight till the vehicle passes', 'Dim the headlight till the vehicle passes'),
    Question('When your vehicle is being overtaken, you should:', 'Stop your vehicle and let the vehicle overtake', 'Increase the speed of your vehicle', 'Not obstruct the other vehicle from overtaking', 'Not obstruct the other vehicle from overtaking'),
    Question('When a motor vehicle is involved in an accident, you should', 'Report to the nearest police station within 24 hours', 'Report to the nearest police station within 12 hours', 'Report to the nearest police station within 48 hours', 'Report to the nearest police station within 24 hours'),
    ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length) {
      _questionNumber++;
    }
  }

  List<Question> getQuestionBank() {
    return _questionBank;
  }

  int bankLength(){
    return _questionBank.length;
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  String getAnswerOptionA() {
    return _questionBank[_questionNumber].optionA;
  }

  String getAnswerOptionB(){
    return _questionBank[_questionNumber].optionB;
  }

  String getAnswerOptionC(){
    return _questionBank[_questionNumber].optionC;
  }

  String getCorrectAnswer() {
    return _questionBank[_questionNumber].correctOption;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;

    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}