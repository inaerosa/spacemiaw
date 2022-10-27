import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
// import 'package:spacemiaw/views/splash_screen.dart';
import 'my_homepage.dart';
import 'sobre.dart';
import 'historia.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Spacemiaw',
        initialRoute: MyHomePage.nomeRota,
        routes: {
          MyHomePage.nomeRota: (context) => MyHomePage(),
          Sobre.nomeRota: (context) => Sobre(),
          Historia.nomeRota: (context) => Historia()
        });
  }
}
