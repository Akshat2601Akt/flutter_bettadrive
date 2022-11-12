import 'package:bettadrive/util/back_button.dart';
import 'package:bettadrive/util/back_button2.dart';
import 'package:flutter/material.dart';
import '../../util/primary_button.dart';
import 'package:bettadrive/constants/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
                top: screenHeight * 0.034,
                left: screenWidth * 0.079,
                right: screenWidth * 0.079),
            child: SingleChildScrollView(
              child: Stack(
                  children: [
                Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.022,
                    ),
                    SizedBox(
                      height: screenHeight * 0.36,
                      width: screenWidth * 0.80,
                      child: Image.asset('images/image 5.png'),
                    ),
                    SizedBox(
                      height: screenHeight * 0.04,
                    ),
                    Text(
                      'Sign In',
                      style: TextStyle(
                          fontFamily: 'Quicksand-SemiBold',
                          fontSize: screenHeight * 0.0215,
                          fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      height: screenHeight * 0.045,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.126),
                      child: Wrap(
                        children: [
                          Text(
                            'Enter you mobile number so that we know who it is.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Quicksand-Regular',
                              fontSize: screenHeight * 0.019,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(99, 99, 99, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.039,
                    ),
                    SizedBox(
                      height: screenHeight * 0.056,
                      child: TextField(
                        keyboardType: TextInputType.number,
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
                      height: screenHeight * 0.05,
                    ),
                    PrimaryButton(
                      onPress: () {
                        Navigator.pushNamed(context, '/third');
                      },
                      label: 'Send OTP',
                    ),
                  ],
                ),
                const Positioned(
                  top: 0.0,
                  left: 0.0,
                  child: GoBackButton2(routeName: '/')
                )
              ]),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(bottom: screenHeight * 0.067),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'New to BettaDrive? ',
                style: TextStyle(
                    fontFamily: 'Quicksand-Regular',
                    fontWeight: FontWeight.w600,
                    fontSize: screenHeight * 0.017,
                    color: const Color.fromRGBO(137, 132, 132, 1)),
              ),
              GestureDetector(
                child: Text(
                  'Register',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Quicksand-Semibold',
                      fontWeight: FontWeight.w800,
                      fontSize: screenHeight * 0.017,
                      color: primaryColor1),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/fourth');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
