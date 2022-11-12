import 'package:flutter/material.dart';
import '../constants/constants.dart';

class FooterBar extends StatelessWidget {
  const FooterBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 80.0,
      decoration: const BoxDecoration(
        color: primaryColor4,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'About Us',
            style: TextStyle(
              fontFamily: 'Quicksand-Regular',
              fontSize: screenHeight * 0.0145,
              fontWeight: FontWeight.w700,
              color: primaryColor8,
            ),
          ),
          Text(
            'Terms & Conditions',
            style: TextStyle(
              fontFamily: 'Quicksand-Regular',
              fontSize: screenHeight * 0.0145,
              fontWeight: FontWeight.w700,
              color: primaryColor8,
            ),
          ),
          Text(
            'Contact Us',
            style: TextStyle(
              fontFamily: 'Quicksand-Regular',
              fontSize: screenHeight * 0.0145,
              fontWeight: FontWeight.w700,
              color: primaryColor8,
            ),
          ),
        ],
      ),
    );
  }
}
