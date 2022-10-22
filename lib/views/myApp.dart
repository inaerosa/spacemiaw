import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:spacemiaw/views/splash_screen.dart';
import 'package:spacemiaw/views/my_homepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: SplashScreen.nomeRota, routes: {
      SplashScreen.nomeRota: (context) => SplashScreen(),
      MyHomePage.nomeRota: (context) => MyHomePage(),
      // Credits.nomeRota: (context) => Credits(),
      // Form.nomeRota: (context) => Form(),
      // Placar.nomeRota: (context) => Placar(),
    });
  }
}
