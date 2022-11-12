import 'dart:io';
import 'package:bettadrive/screens/homescreen.dart';
import 'package:bettadrive/screens/otpscreen.dart';
import 'package:bettadrive/screens/quiz.dart';
import 'package:bettadrive/screens/recent_tests_screen.dart';
import 'package:bettadrive/screens/sign_inscreen.dart';
import 'package:bettadrive/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'screens/landingscreen.dart';

void main() {
  runApp(const MyApp());
  HttpOverrides.global = MyHttpOverrides();
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const LandingScreen(),
          '/second': (context) => const LoginScreen(),
          '/third': (context) => const OTPScreen(),
          '/fourth': (context) => const SignUpScreen(),
          '/fifth': (context) => const HomeScreen(),
          '/sixth': (context) => const QuizPage(),
          '/seventh': (context) => RecentActivitiesScreen(),
        },
    );
  }
}
