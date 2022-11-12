import 'dart:async';
import 'package:flutter/material.dart';
import '../constants/constants.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  int timeLeft = 59;

  void _startCountdown() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          if (timeLeft > 0) {
            timeLeft--;
          } else {
            timer.cancel();
          }
        });
      }
    });
  }

  void _resetTimer() {
    timeLeft = 59;
    _startCountdown();
  }

  List<String> currentPin = ['', '', '', ''];
  TextEditingController pinOneController = TextEditingController();
  TextEditingController pinTwoController = TextEditingController();
  TextEditingController pinThreeController = TextEditingController();
  TextEditingController pinFourController = TextEditingController();

  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: const BorderSide(color: Colors.black, width: 4.0),
  );

  int pinIndex = 0;

  buildNumberPad() {
    return Expanded(
        child: Container(
        color: primaryColor8,
        alignment: Alignment.bottomCenter,
        child: Padding(
        padding: const EdgeInsets.only(top: 50.0, bottom: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                KeyboardNumber(
                    onPressed: () {
                      pinIndexSetup('1');
                    },
                    n: 1),
                KeyboardNumber(
                    onPressed: () {
                      pinIndexSetup('2');
                    },
                    n: 2),
                KeyboardNumber(
                    onPressed: () {
                      pinIndexSetup('3');
                    },
                    n: 3),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                KeyboardNumber(
                    onPressed: () {
                      pinIndexSetup('4');
                    },
                    n: 4),
                KeyboardNumber(
                    onPressed: () {
                      pinIndexSetup('5');
                    },
                    n: 5),
                KeyboardNumber(
                    onPressed: () {
                      pinIndexSetup('6');
                    },
                    n: 6),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                KeyboardNumber(
                    onPressed: () {
                      pinIndexSetup('7');
                    },
                    n: 7),
                KeyboardNumber(
                    onPressed: () {
                      pinIndexSetup('8');
                    },
                    n: 8),
                KeyboardNumber(
                    onPressed: () {
                      pinIndexSetup('9');
                    },
                    n: 9),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 60.0,
                  child: MaterialButton(
                    color: Colors.white,
                    height: 60.0,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                    onPressed: () {
                      if (pinFourController.text != '') {
                        Navigator.pushNamed(context, '/fifth');
                        pinOneController.clear();
                        pinTwoController.clear();
                        pinThreeController.clear();
                        pinFourController.clear();
                      }
                    },
                    child: const Icon(
                      Icons.check,
                      color: primaryColor1,
                    ),
                  ),
                ),
                KeyboardNumber(
                    onPressed: () {
                      pinIndexSetup('0');
                    },
                    n: 0),
                SizedBox(
                  width: 60.0,
                  child: MaterialButton(
                    color: Colors.white,
                    elevation: 0.0,
                    height: 60.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                    onPressed: () {
                      clearPin();
                    },
                    child: const Icon(Icons.backspace_outlined),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }

  clearPin() {
    if (pinIndex == 0) {
      pinIndex = 0;
    } else if (pinIndex <= 4 && pinIndex >= 1) {
      setPin(pinIndex, '');
      currentPin[pinIndex - 1] = '';
      pinIndex--;
    }
  }

  pinIndexSetup(String text) {
    if (pinIndex == 0) {
      pinIndex = 1;
    } else if (pinIndex < 4) {
      pinIndex++;
    }
    setPin(pinIndex, text);
    String strPin = '';
    for (var e in currentPin) {
      strPin += e;
    }
    if (pinIndex == 4) {}
  }

  setPin(int n, String text) {
    switch (n) {
      case 1:
        pinOneController.text = text;
        break;
      case 2:
        pinTwoController.text = text;
        break;
      case 3:
        pinThreeController.text = text;
        break;
      case 4:
        pinFourController.text = text;
        break;
    }
  }

  buildPinRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PINNumber(
          textEditingController: pinOneController,
          outlineInputBorder: outlineInputBorder,
        ),
        PINNumber(
          textEditingController: pinTwoController,
          outlineInputBorder: outlineInputBorder,
        ),
        PINNumber(
          textEditingController: pinThreeController,
          outlineInputBorder: outlineInputBorder,
        ),
        PINNumber(
          textEditingController: pinFourController,
          outlineInputBorder: outlineInputBorder,
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Stack(children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight * 0.034,
                      left: screenWidth * 0.079,
                      right: screenWidth * 0.079),
                  child: Column(
                    children: [
                      SizedBox(
                        height: screenHeight * 0.045,
                      ),
                      Text(
                        'Verify Your Number',
                        style: TextStyle(
                            fontFamily: 'Quicksand-SemiBold',
                            fontSize: screenHeight * 0.0215,
                            fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        height: screenHeight * 0.045,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.196),
                        child: Wrap(
                          children: [
                            Text(
                              'Enter 4-digit code sent at your number',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Quicksand-Regular',
                                fontSize: screenHeight * 0.019,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.075,
                      ),
                      buildPinRow(),
                      SizedBox(
                        height: screenHeight * 0.037,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            timeLeft == 0
                                ? 'Didn’t receive an OTP? '
                                : 'Resend OTP ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Quicksand-Regular',
                              fontSize: screenHeight * 0.019,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (timeLeft == 0) {
                                  _resetTimer();
                                }
                              });
                            },
                            child: Text(
                              timeLeft != 0
                                  ? (timeLeft < 10
                                      ? ' 00:0' + timeLeft.toString()
                                      : ' 00:' + timeLeft.toString())
                                  : 'Resend OTP',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  decoration: timeLeft == 0
                                      ? TextDecoration.underline
                                      : TextDecoration.none,
                                  fontFamily: 'Quicksand-Regular',
                                  fontSize: screenHeight * 0.019,
                                  fontWeight: FontWeight.w400,
                                  color: primaryColor1),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.160,
                      ),
                    ],
                  ),
                ),
                buildNumberPad(),
              ],
            ),
            Positioned(
              top: screenHeight * 0.034,
              left: screenWidth * 0.079,
              child: GestureDetector(
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
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class PINNumber extends StatelessWidget {
  final TextEditingController textEditingController;
  final OutlineInputBorder outlineInputBorder;
  const PINNumber(
      {required this.textEditingController, required this.outlineInputBorder});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
      width: 50.0,
      height: 50.0,
      child: TextField(
        controller: textEditingController,
        enabled: false,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: outlineInputBorder,
          filled: true,
          fillColor: Colors.white30,
        ),
      ),
    );
  }
}

class KeyboardNumber extends StatelessWidget {
  final int n;
  final Function() onPressed;
  const KeyboardNumber({required this.onPressed, required this.n});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      width: 60.0,
      height: 60.0,
      alignment: Alignment.center,
      child: MaterialButton(
        onPressed: onPressed,
        height: 50.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text(
          '$n',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Archivo',
            fontWeight: FontWeight.w300,
            fontSize: MediaQuery.of(context).size.height * 0.029,
          ),
        ),
      ),
    );
  }
}
