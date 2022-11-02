import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'jogo.dart';

class Historia extends StatefulWidget {
  static const nomeRota = "/Historia";

  _HistoriaState createState() => _HistoriaState();
}

class _HistoriaState extends State<Historia> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 8), () {
      Navigator.pushNamed(context, Jogo.nomeRota);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/assets/images/fundo.gif'),
              fit: BoxFit.fill)),
      child: Stack(children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.only(top: 420),
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage('lib/assets/images/cat.png'),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.18,
              child: Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromARGB(255, 255, 7, 181),
                        width: 5,
                        style: BorderStyle.solid)),
                child: const Text(
                  'Olá, viajante! A partir de agora você está responsável por ajudar o gatonaura em sua missão de capturar o máximo de estrelas e fugir dos asteróides, mas esteja sempre atento a possíveis visitas de outros seres 👾',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.none,
                    fontSize: 14,
                    fontFamily: 'Silkscreen',
                  ),
                ),
              )),
        ),
      ]),
    );
  }
}
