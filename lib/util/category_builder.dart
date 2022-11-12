import 'package:bettadrive/util/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:bettadrive/constants/constants.dart';

class CategoryBuilder extends StatelessWidget {
  final VoidCallback onPress;
  final String label;
  final String imageLink;
  const CategoryBuilder(
      {required this.onPress, required this.label, required this.imageLink});
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          height: screenHeight * 0.355,
          width: screenWidth * 0.9,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 10.0,
                  spreadRadius: 0.002,
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                ),
              ]
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.asset(
                  imageLink,
                  fit: BoxFit.fitWidth,
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.2,
                  color: Colors.grey.withOpacity(0.8),
                  colorBlendMode: BlendMode.modulate,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 0.0),
                        child: Wrap(
                            children: [
                          Text(
                            'Topic: $label',
                            style: TextStyle(
                                fontFamily: 'Quicksand-SemiBold',
                                fontSize: screenHeight * 0.025,
                                fontWeight: FontWeight.w800,
                                color: Colors.black),
                          ),
                        ]),
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Instructor: Aashi Patni',
                      style: TextStyle(
                          fontFamily: 'Quicksand-Regular',
                          fontSize: screenHeight * 0.018,
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Rating: ',
                          style: TextStyle(
                              fontFamily: 'Quicksand-Regular',
                              fontSize: screenHeight * 0.018,
                              fontWeight: FontWeight.w800,
                              color: Colors.black),
                        ),
                        Icon(
                            Icons.star_rounded,
                          size: screenHeight * 0.018,
                          color: Color(0xffFFD700),
                        ),
                        Icon(
                          Icons.star_rounded,
                          size: screenHeight * 0.018,
                          color: Color(0xffFFD700),
                        ),
                        Icon(
                          Icons.star_rounded,
                          size: screenHeight * 0.018,
                          color: Color(0xffFFD700),
                        ),
                        Icon(
                          Icons.star_half_rounded,
                          size: screenHeight * 0.018,
                          color: Color(0xffFFD700),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    SecondaryButton(onPress: onPress, label: "Start Test")
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20.0,
        )
      ],
    );
  }
}
