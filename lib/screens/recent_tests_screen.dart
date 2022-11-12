import 'package:bettadrive/constants/constants.dart';
import 'package:bettadrive/util/back_button.dart';
import 'package:flutter/material.dart';
import '../util/content_cards.dart';
import '../util/footer_bar.dart';

class RecentActivitiesScreen extends StatelessWidget {

  List<String> testCategory = ['Road Signs', 'Random Questions'];
  List<String> testScore = ['8/10', '12/18'];
  List<String> testImage = ['images/road signs.jpeg', 'images/random questions.jpeg'];

  RecentActivitiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          GoBackButton(),
                          Text(
                            'Recent Tests',
                            style: TextStyle(
                                fontFamily: 'Quicksand-SemiBold',
                                fontWeight: FontWeight.w800,
                                fontSize: 20.0),
                          ),
                          CircleAvatar(
                            radius: 27.0,
                            backgroundImage: NetworkImage(
                              imageURL
                          )
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Flexible(
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: 2,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: ContentCards(
                            childWidget: Container(
                              height: 135.0,
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        bottomLeft: Radius.circular(15)),
                                    child: Image.asset(
                                      testImage[index],
                                      fit: BoxFit.fitHeight,
                                      width: screenWidth * 0.4,
                                      height: screenHeight * 0.15,
                                      color: Colors.grey.withOpacity(0.9),
                                      colorBlendMode: BlendMode.modulate,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15.0,
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.4,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Topic: \n${testCategory[index]}',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontFamily: 'Quicksand-SemiBold',
                                              fontWeight: FontWeight.w800,
                                              fontSize: 18,
                                              color: Colors.black),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Score: ${testScore[index]}',
                                          style: const TextStyle(
                                            fontFamily: 'SourceSansPro',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
          const Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: FooterBar(),
          )
    ]
      ),
    );
  }
}
