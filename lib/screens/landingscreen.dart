import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.21),
            child: Column(
              children: [
                Image.asset('images/bettadrive.jpg',
                    height: screenHeight * 0.32, width: screenWidth * 0.8),
                SizedBox(
                  height: screenHeight * 0.088,
                ),
                Text(
                  'Welcome to BettaDrive',
                  style: TextStyle(
                      fontFamily: 'Quicksand-SemiBold',
                      fontWeight: FontWeight.w800,
                      fontSize: screenHeight * 0.021),
                ),
                SizedBox(
                  height: screenHeight * 0.043,
                ),
                Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: screenWidth * 0.093),
                  child: Wrap(
                    children: [
                      Text(
                        'Driving Test Assessment Platform',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.archivo(
                          textStyle: TextStyle(
                            fontFamily: 'Quicksand-Regular',
                            fontSize: screenHeight * 0.019,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            child: Container(
              height: screenHeight * 0.075,
              width: screenWidth * 0.5,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.only(topRight: Radius.circular(25.0))),
              child: Center(
                child: Text(
                  'Sign In',
                  style: TextStyle(
                      fontFamily: 'Quicksand-SemiBold',
                      fontWeight: FontWeight.w800,
                      fontSize: screenHeight * 0.021,
                    color: const Color(0XFF2944a4),
                  ),
                ),
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/second');
            },
          ),
          GestureDetector(
            child: Container(
              height: screenHeight * 0.075,
              width: screenWidth * 0.5,
              decoration: const BoxDecoration(
                  color: Color(0XFF2944a4),
                  borderRadius:
                  BorderRadius.only(topLeft: Radius.circular(25.0))),
              child: Center(
                child: Text(
                  'Create Account',
                  style: TextStyle(
                      fontFamily: 'Quicksand-SemiBold',
                      fontWeight: FontWeight.w600,
                      fontSize: screenHeight * 0.021,
                      color: Colors.white),
                ),
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/fourth');
            },
          )
        ],
      ),
    );
  }
}
