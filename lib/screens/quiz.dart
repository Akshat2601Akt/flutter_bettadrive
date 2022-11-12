import 'dart:async';
import 'package:bettadrive/constants/constants.dart';
import 'package:bettadrive/screens/scorescreen.dart';
import 'package:bettadrive/util/back_button.dart';
import 'package:bettadrive/util/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../constants/quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();
enum Choice {A, B, C, Null}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Choice answerChoice = Choice.Null;
  static const maxSeconds = 45;
  int duration = maxSeconds;
  int score = 0;
  List<int> timeKeeper = [];
  List<int> scoreKeeper = [];
  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (duration > 0) {
        setState(() => duration--);
      } else {
        stopTimer(reset: false);
      }
    });
  }

  void resetTimer() {
    duration = maxSeconds;
    startTimer();
  }

  void stopTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    } else {
      timer?.cancel();
    }
  }

  void checkAnswer(String userPickedAnswer) {
    String correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      if (quizBrain.isFinished() == true) {
        stopTimer(reset: false);
        print(score);
        print(quizBrain.bankLength());
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the test.',
          style: const AlertStyle(
            titleStyle: TextStyle(
                fontFamily: 'Quicksand-SemiBold',
                fontWeight: FontWeight.w800,
                fontSize: 22.0
            ),
            descStyle: TextStyle(
              fontFamily: 'Quicksand-Regular',
              fontWeight: FontWeight.w800,
              fontSize: 18.0
            )
          ),
          buttons: [
            DialogButton(
              height: 50.0,
              width: 200.0,
              onPressed: () {
                quizBrain.reset();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ScoreScreen(
                            score: score,
                            total: quizBrain.bankLength(),
                            timeKeeper: timeKeeper,
                        scoreKeeper: scoreKeeper,
                          )),
                );
              },
              color: primaryColor4,
              child: const Text(
                "View Result",
                textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Quicksand-Regular',
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      fontSize: 18.0
                  )
              ),
            ),
          ],
        ).show();
      } else {
        if (userPickedAnswer == correctAnswer) {
          score++;
          scoreKeeper.add(1);
        }
        else {
          scoreKeeper.add(0);
        }
        quizBrain.nextQuestion();
        answerChoice = Choice.Null;
        timeKeeper.add(duration);
        stopTimer(reset: false);
        resetTimer();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: primaryColor2,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            physics: const ClampingScrollPhysics(),
            children: <Widget>[
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const GoBackButton(),
                const SizedBox(
                  width: 120.0,
                ),
                buildTimer(),
              ]),
              const SizedBox(
                height: 30.0,
              ),
              Center(
                child: Text(
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              GestureDetector(
                onTap: () {
                  answerChoice = Choice.A;
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    height: screenHeight * 0.13,
                    width: screenWidth * 0.8,
                    decoration: BoxDecoration(
                        color: answerChoice == Choice.A ? primaryColor7 : Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 10.0,
                            spreadRadius: 0.002,
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                          ),
                        ]),
                    child: Text(
                           quizBrain.getAnswerOptionA(),
                           textAlign: TextAlign.center,
                           style: const TextStyle(
                             fontFamily: 'Quicksand-Regular',
                             fontWeight: FontWeight.w800,
                             color: primaryColor2,
                             fontSize: 18.0,
                           ),
                         ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  answerChoice = Choice.B;
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    height: screenHeight * 0.13,
                    width: screenWidth * 0.8,
                    decoration: BoxDecoration(
                        color: answerChoice == Choice.B ? primaryColor7 : Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 10.0,
                            spreadRadius: 0.002,
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                          ),
                        ]),
                    child: Text(
                      quizBrain.getAnswerOptionB(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Quicksand-Regular',
                        fontWeight: FontWeight.w800,
                        color: primaryColor2,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  answerChoice = Choice.C;
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    height: screenHeight * 0.13,
                    width: screenWidth * 0.8,
                    decoration: BoxDecoration(
                        color: answerChoice == Choice.C ? primaryColor7 : Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 10.0,
                            spreadRadius: 0.002,
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                          ),
                        ]),
                    child: Text(
                      quizBrain.getAnswerOptionC(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Quicksand-Regular',
                        fontWeight: FontWeight.w800,
                        color: primaryColor2,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PrimaryButton(
                    onPress:
                        (){
                      answerChoice == Choice.Null ? null :
                      answerChoice == Choice.A ? checkAnswer(quizBrain.getAnswerOptionA()):
                      answerChoice == Choice.B ? checkAnswer(quizBrain.getAnswerOptionB()):
                      checkAnswer(quizBrain.getAnswerOptionC());
                        },
                    label: 'Next'),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTimer() => SizedBox(
        width: 80.0,
        height: 80.0,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CircularProgressIndicator(
              value: 1 - duration / maxSeconds,
              strokeWidth: 6,
              backgroundColor: primaryColor5,
              valueColor: const AlwaysStoppedAnimation(primaryColor8),
            ),
            Center(child: buildTime())
          ],
        ),
      );

  Widget buildTime() {
    return Text(
      '$duration',
      style: const TextStyle(fontSize: 20.0, color: primaryColor8),
    );
  }
}
