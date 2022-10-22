import 'dart:async';

import 'package:flutter/material.dart';
import './my_homepage.dart';

class SplashScreen extends StatefulWidget {
  static const nomeRota = "/splashScreen";

  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      //Navigator.pushNamed(context, MyHomePage.nomeRota);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
