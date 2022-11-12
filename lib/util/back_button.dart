import 'package:flutter/material.dart';
import '../constants/constants.dart';

class GoBackButton extends StatelessWidget {
  const GoBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      child: Container(
        height: screenHeight * 0.04,
        width: screenWidth * 0.081,
        decoration: BoxDecoration(
            color: primaryColor1,
            borderRadius: BorderRadius.circular(10.0)),
        child: const Icon(
          Icons.arrow_back_ios_outlined,
          color: Colors.white,
          size: 16,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
