import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'myCat.dart';

class Jogo extends StatefulWidget {
  static const nomeRota = "/jogo";

  const Jogo({Key? key}) : super(key: key);

  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  double catY = 0;
  void up() {
    setState(() {
      catY -= 0.05;
    });

    print(catY);
  }

  void down() {
    setState(() {
      catY += 0.05;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorSchemeSeed: const Color.fromARGB(255, 255, 7, 181)),
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.only(bottom: 100),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/images/fundo.gif'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 8,
                child: Container(
                  padding: const EdgeInsets.only(right: 250),
                  child:
                      Stack(alignment: Alignment(0, catY), children: [MyCat()]),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: up,
                    child: const Icon(Icons.arrow_drop_up_outlined),
                  ),
                  ElevatedButton(
                    onPressed: down,
                    child: const Icon(Icons.arrow_drop_down),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
