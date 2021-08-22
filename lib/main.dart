import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:visitors_book/Screens/WelcomeScreen.dart';



void main() async {

  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Color(0xff0A1931),
      ),
      home: WelcomeScreen(),
    );
  }
}

