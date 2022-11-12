import 'package:flutter/material.dart';
import 'package:bettadrive/constants/constants.dart';

class SecondaryButton extends StatelessWidget {
  final VoidCallback onPress;
  final String label;
  const SecondaryButton({required this.onPress, required this.label});
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight * 0.044,
      width: screenWidth * 0.350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: primaryColor4,
      ),
      child: Center(
        child: GestureDetector(
          onTap: onPress,
          child: Text(
            label,
            style: TextStyle(
                fontFamily: 'Quicksand-SemiBold',
                fontSize: screenHeight * 0.018,
                fontWeight: FontWeight.w800,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
