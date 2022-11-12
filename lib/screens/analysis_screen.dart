import 'package:bettadrive/constants/barchart_model.dart';
import 'package:bettadrive/constants/constants.dart';
import 'package:bettadrive/util/back_button.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:charts_flutter_new/flutter.dart'as charts;
import '../util/primary_button.dart';
import 'answerkey_screen.dart';

class AnalysisScreen extends StatefulWidget {
  final int score;
  final int total;
  final List<int> timeKeeper;
  final List<int> scoreKeeper;
  const AnalysisScreen(
      {Key? key,
      required this.score,
      required this.total,
      required this.timeKeeper,
      required this.scoreKeeper})
      : super(key: key);

  @override
  State<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  List<BarChartModel> chartData = [];

  int totalTime(){
    int sum = 0;
    for(int i = 0; i < widget.timeKeeper.length; i++){
      sum = sum + 45 - widget.timeKeeper[i];
    }
    return sum;
  }

  double averageTime(){
    int sum = totalTime();
    return sum/widget.timeKeeper.length;
  }

  @override
  void initState() {
    for (int i = 0; i < widget.timeKeeper.length; i++) {
      chartData.add(
          BarChartModel(
          question: (i+1).toString(),
          time: widget.timeKeeper[i],
          ),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int score = widget.score;
    int total = widget.total;

    List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
        id: 'Time',
        data: chartData,
        domainFn: (BarChartModel series, _)=> series.question,
        measureFn: (BarChartModel series, _)=> series.time,
      )
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          children: [
            Column(children: [
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: GoBackButton(),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  'YOUR SCORE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    (widget.score).toString(),
                    style: TextStyle(
                        fontFamily: 'Quicksand-SemiBold',
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: (widget.total / widget.score < 2)
                            ? Colors.green[700]
                            : Colors.red[900]),
                  ),
                  Text(
                    '/${widget.total}',
                    style: const TextStyle(
                      fontFamily: 'Quicksand-SemiBold',
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  'Eligibility Criteria: ${(total*0.6).toInt()}/$total',
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Divider(
                thickness: 3.0,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  'Accuracy:',
                  style: TextStyle(
                    fontFamily: 'Quicksand-SemiBold',
                    fontSize: 25.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: SizedBox(
                  height: 300.0,
                  child: PieChart(
                    PieChartData(sections: [
                      PieChartSectionData(
                          value: score / total * 100,
                          radius: 58.0,
                          color: primaryColor2,
                          title: '${score / total * 100}%',
                          titleStyle: const TextStyle(
                              fontFamily: 'Quicksand-Regular',
                              fontSize: 18.0,
                              color: primaryColor8)),
                      PieChartSectionData(
                          value: (total - score) / total * 100,
                          radius: 50.0,
                          color: primaryColor7,
                          showTitle: false),
                    ]),
                    swapAnimationDuration:
                        const Duration(milliseconds: 850), // Optional
                    swapAnimationCurve: Curves.linear,
                    // Optional
                  ),
                ),
              ),
              const Divider(
                thickness: 3.0,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 25.0),
                child: Text(
                  'Time Analysis:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Quicksand-SemiBold',
                    fontSize: 25.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Text(
                'Total time taken for test: ${totalTime()} seconds',
                style: const TextStyle(
                  fontFamily: 'Quicksand-SemiBold',
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Average time taken per question: ${averageTime().toInt()} seconds',
                style: const TextStyle(
                  fontFamily: 'Quicksand-SemiBold',
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Text(
                  'Time taken vs Question ',
                  style: TextStyle(
                    fontFamily: 'Quicksand-SemiBold',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(
                height: 400.0,
                child: charts.BarChart(
                  series,
                  animate: true,
                ),
              ),
              const SizedBox(
                height: 50.0,
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
              const SizedBox(
                height: 20.0,
              ),
              PrimaryButton(
                onPress: () => Navigator.pushNamed(context, '/fifth'),
                label: 'Back to Home Screen',
              ),
              const SizedBox(
                height: 20.0,
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
