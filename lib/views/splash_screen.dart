import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import '../widget/circular_image.dart';
import './my_homepage.dart';

class SplashScreen extends StatefulWidget {
  static const nomeRota = "/splashscreen";

  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamed(context, MyHomePage.nomeRota);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/images/fundo.gif'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularImage(
              imageProvider: AssetImage('lib/assets/images/cat.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 25),
              child: const Text(
                'SPACE MIAW',
                style: TextStyle(
                  fontFamily: '1up',
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 100, right: 100),
                child: CircularProgressIndicator(
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    valueColor: AlwaysStoppedAnimation(
                        Color.fromARGB(255, 255, 7, 181)))),
          ],
        ),
      ),
    );
  }
}
