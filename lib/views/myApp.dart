import 'package:flutter/material.dart';
import 'package:test/views/splash_screen.dart';
import 'splash_screen.dart';
import 'my_homepage.dart';
import 'sobre.dart';
import 'historia.dart';
import 'jogo.dart';
import 'form.dart';
import 'ranking.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Spacemiaw',
        initialRoute: SplashScreen.nomeRota,
        routes: {
          SplashScreen.nomeRota: (context) => SplashScreen(),
          MyHomePage.nomeRota: (context) => MyHomePage(),
          Sobre.nomeRota: (context) => Sobre(),
          Historia.nomeRota: (context) => Historia(),
          Jogo.nomeRota: (context) => Jogo(),
          Formulario.nomeRota: (context) => Formulario(),
          Ranking.nomeRota: (context) => Ranking(),
        });
  }
}
