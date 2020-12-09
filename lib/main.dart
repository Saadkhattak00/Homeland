import 'package:flutter/material.dart';
import 'package:home_land/detailpage.dart';
import 'package:home_land/homlandpage.dart';
import 'package:home_land/login.dart';
import 'package:home_land/signup.dart';
import 'package:home_land/welcome.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(MyApp());
  Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: welcome.id,
      routes: {
        welcome.id: (context) => welcome(),
        login.id: (context) => login(),
        signup.id: (context) => signup(),
        homelandpage.id: (context) => homelandpage(),
        detailpage.id: (context) => detailpage(),
      },
    );
  }
}
