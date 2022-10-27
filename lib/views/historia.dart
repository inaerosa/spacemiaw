import 'dart:async';

import 'package:flutter/material.dart';

import 'my_homepage.dart';

class Historia extends StatefulWidget {
  static const nomeRota = "/Historia";

  _HistoriaState createState() => _HistoriaState();
}

class _HistoriaState extends State<Historia> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 10), () {
      Navigator.pushNamed(context, MyHomePage.nomeRota);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      // ignore: prefer_const_constructors
      decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage('lib/assets/images/fundo.gif'),
              fit: BoxFit.fill)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
              color: Colors.white,
              child: const Text(
                'AJUDE O GATONAUTA A CAPTURAR O MÁXIMO DE ESTRELAS, FUJA DOS ASTEROIDES...E SE VOCÊ TIVER SORTE, PODE ENCONTRAR UM E.T',
                style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  fontSize: 14,
                  fontFamily: 'Silkscreen',
                ),
              ))
        ],
      ),
    );
  }
}
