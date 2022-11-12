import 'package:bettadrive/constants/constants.dart';
import 'package:bettadrive/screens/quiz.dart';
import 'package:bettadrive/util/back_button.dart';
import 'package:flutter/material.dart';
import '../constants/questions.dart';
import '../util/primary_button.dart';

class AnswerKeyScreen extends StatelessWidget {
  final int score;
  final int total;
  AnswerKeyScreen({
    Key? key,
    required this.score,
    required this.total,
  }) : super(key: key);
  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: primaryColor8,
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          SizedBox(
            height: screenHeight * 2.7,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const GoBackButton(),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Center(
                      child: Text(
                        'YOUR SCORE',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        (score).toString(),
                        style: TextStyle(
                            fontFamily: 'Quicksand-SemiBold',
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                            color: (total/score < 2)
                                ? Colors.green[700]
                                : Colors.red[900]),
                      ),
                      Text(
                        '/$total',
                        style: const TextStyle(
                          fontFamily: 'Quicksand-SemiBold',
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: screenWidth,
                    height: screenHeight * 2.49,
                    child: ScoreSheet(),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: PrimaryButton(
              onPress: () => Navigator.pushNamed(context, '/fifth'),
              label: 'Back to Home Screen',
            ),
          ),
        ],
      ),
    );
  }
}

ScoreSheet() {
  final List<Question> questionBank = quizBrain.getQuestionBank();
  return SizedBox(
    child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: quizBrain.bankLength(),
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('\nQuestion: ${questionBank[index].questionText}\n',
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0,
                      color: primaryColor2)),
              Text('A. ${questionBank[index].optionA}'),
              Text('B. ${questionBank[index].optionB}'),
              Text('C. ${questionBank[index].optionC}'),
              Text('\nCorrect Answer: ${questionBank[index].correctOption}')
            ],
          );
        }),
  );
}
