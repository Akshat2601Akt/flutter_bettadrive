import 'package:bettadrive/screens/analysis_screen.dart';
import 'package:bettadrive/screens/answerkey_screen.dart';
import 'package:bettadrive/util/primary_button.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';

class ScoreScreen extends StatefulWidget {
  final int score;
  final int total;
  final List<int> timeKeeper;
  final List<int> scoreKeeper;
  const ScoreScreen({Key? key, required this.score, required this.total, required this.timeKeeper, required this.scoreKeeper}) : super(key: key);

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: primaryColor7,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 150.0),
                child: Text('Test Result',
                  style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.black
                  ),
                ),
              ),
              Text('YOUR SCORE',
              style: TextStyle(
                // fontFamily: 'Quicksand-SemiBold',
               fontSize: 18.0,
                fontWeight: FontWeight.w400,
                color: Colors.black87
              ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text((widget.score).toString(),
                    style: TextStyle(
                      fontFamily: 'Quicksand-SemiBold',
                      fontSize: 100.0,
                      fontWeight: FontWeight.bold,
                      color: (widget.total/widget.score < 2) ? Colors.green[700] : Colors.red[900]
                    ),
                  ),
                  Text('/' + widget.total.toString(),
                  style: TextStyle(
                    fontFamily: 'Quicksand-SemiBold',
                    fontSize: 100.0,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text((widget.total/widget.score < 2) ? 'CONGRATULATIONS!' : 'BAD LUCK!',
                style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w800,
                    color: (widget.total/widget.score < 2) ? Colors.green[700] : Colors.red[900]
                ),
              ),
              SizedBox(
                height: 100.0,
              ),
              PrimaryButton(
                  onPress: () =>
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AnswerKeyScreen(total: widget.total, score: widget.score,)
                        ),
                      ),
                  label: 'View Answer Key',
              ),
              SizedBox(
                height: 20.0,
              ),
              PrimaryButton(
                onPress: ()
                =>
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AnalysisScreen(
                            score: widget.score,
                            total: widget.total,
                            timeKeeper: widget.timeKeeper,
                            scoreKeeper: widget.scoreKeeper,
                          )
                      ),
                    ),
                label: 'Analyse Score',
              ),
              SizedBox(
                height: 20.0,
              ),
              PrimaryButton(
                onPress: () => Navigator.pushNamed(context, '/fifth'),
                label: 'Back to Home Screen',
              )
            ],
          ),
        ),
      ),
    );
  }
}
