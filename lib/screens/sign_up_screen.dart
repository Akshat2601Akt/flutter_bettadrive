import 'package:bettadrive/util/back_button.dart';
import 'package:flutter/material.dart';
import 'package:bettadrive/constants/constants.dart';
import '../util/primary_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                top: screenHeight * 0.034,
                left: screenWidth * 0.079,
                right: screenWidth * 0.079),
            child: Stack(
              children: [
                Column(children: [
                  SizedBox(
                    height: screenHeight * 0.022,
                  ),
                  SizedBox(
                    height: screenHeight * 0.3,
                    width: screenWidth * 0.61,
                    child: Image.asset('images/image 6.png'),
                  ),
                  Text(
                    'Sign Up',
                    style: TextStyle(
                        fontFamily: 'Quicksand-SemiBold',
                        fontSize: screenHeight * 0.0215,
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  Text(
                    'Let’s get to know you better',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Quicksand-Regular',
                      fontSize: screenHeight * 0.019,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(99, 99, 99, 1),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.039,
                  ),
                  SizedBox(
                    height: screenHeight * 0.056,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.04,
                            vertical: screenHeight * 0.015),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0XFFE0E0E0)),
                            borderRadius: BorderRadius.circular(8)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Color(0XFFE0E0E0)),
                            borderRadius: BorderRadius.circular(8)),
                        hintText: 'Name',
                        hintStyle: TextStyle(
                          fontFamily: 'Quicksand-Regular',
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(166, 157, 157, 1),
                          fontSize: screenHeight * 0.015,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.011,
                  ),
                  SizedBox(
                    height: screenHeight * 0.056,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.04,
                            vertical: screenHeight * 0.015),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0XFFE0E0E0)),
                            borderRadius: BorderRadius.circular(8)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Color(0XFFE0E0E0)),
                            borderRadius: BorderRadius.circular(8)),
                        hintText: 'Aadhar Number',
                        hintStyle: TextStyle(
                          fontFamily: 'Quicksand-Regular',
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(166, 157, 157, 1),
                          fontSize: screenHeight * 0.015,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.011,
                  ),
                  SizedBox(
                    height: screenHeight * 0.056,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.04,
                            vertical: screenHeight * 0.015),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0XFFE0E0E0)),
                            borderRadius: BorderRadius.circular(8)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Color(0XFFE0E0E0)),
                            borderRadius: BorderRadius.circular(8)),
                        hintText: 'Mobile No.',
                        hintStyle: TextStyle(
                          fontFamily: 'Quicksand-Regular',
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(166, 157, 157, 1),
                          fontSize: screenHeight * 0.015,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.011,
                  ),
                  SizedBox(
                    height: screenHeight * 0.056,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.04,
                            vertical: screenHeight * 0.015),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0XFFE0E0E0)),
                            borderRadius: BorderRadius.circular(8)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Color(0XFFE0E0E0)),
                            borderRadius: BorderRadius.circular(8)),
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          fontFamily: 'Quicksand-Regular',
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(166, 157, 157, 1),
                          fontSize: screenHeight * 0.015,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.04,
                  ),
                  PrimaryButton(
                    onPress: () {
                      Navigator.pushNamed(context, '/third');
                    },
                    label: 'Send OTP',
                  ),
                  Container(
                    padding: EdgeInsets.only(top: screenHeight * 0.047),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already a user? ',
                          style: TextStyle(
                              fontFamily: 'Quicksand-Regular',
                              fontWeight: FontWeight.w600,
                              fontSize: screenHeight * 0.017,
                              color: const Color.fromRGBO(137, 132, 132, 1)),
                        ),
                        GestureDetector(
                          child: Text(
                            'Sign In',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Quicksand-SemiBold',
                                fontWeight: FontWeight.w800,
                                fontSize: screenHeight * 0.017,
                                color: primaryColor1),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, '/second');
                          },
                        ),
                      ],
                    ),
                  )
                ]),
                const Positioned(
                  top: 0.0,
                  left: 0.0,
                  child: GoBackButton()
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
