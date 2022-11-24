import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test/views/form.dart';

import 'myCat.dart';

class Jogo extends StatefulWidget {
  static const nomeRota = "/jogo";

  const Jogo({Key? key}) : super(key: key);

  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  double catY = 0;
  static double meteorXone = 1.1;
  static double meteorXtwo = meteorXone + 1.5;
  double meteorXthree = meteorXtwo + 1.5;
  static double starXone = 1.1;
  static double starXtwo = starXone + 1.5;
  double starXthree = starXtwo + 1.5;
  int points = 0;
  void up() {
    setState(() {
      catY -= 0.05;
    });
  }

  void down() {
    setState(() {
      catY += 0.05;
    });
  }

  void runGame() {
    Timer.periodic(Duration(milliseconds: 300), (timer) {
      setState(() {
        if (meteorXone < -2) {
          meteorXone += 3.5;
        } else {
          meteorXone -= 0.5;
        }

        if (meteorXtwo < -2) {
          meteorXtwo += 3.5;
        } else {
          meteorXtwo -= 0.05;
        }

        if (meteorXthree < -2) {
          meteorXthree += 3.5;
        } else {
          meteorXthree -= 0.05;
        }
      });

      setState(() {
        if (starXone < -2) {
          starXone += 3.5;
        } else {
          starXone -= 0.5;
        }

        if (starXtwo < -2) {
          starXtwo += 3.5;
        } else {
          starXtwo -= 0.05;
        }

        if (starXthree < -2) {
          starXthree += 3.5;
        } else {
          starXthree -= 0.05;
        }

        // if ((meteorXtwo.toStringAsFixed(2) == (0.65).toString() ||
        //         meteorXtwo.toStringAsFixed(2) == (0.60).toString()) &&
        //     (catY == -0.7000000000000001 || catY == 0.65)) {
        //   print('MARCADO');
        //   // timer.cancel();
        //   // Navigator.pushNamed(context, Formulario.nomeRota);
        // }
      });
      var catDies = catY == -0.6 || catY == -0.7 || catY == -0.65;
      var meteorDies = meteorXtwo.toStringAsFixed(2) == (0.65).toString() ||
          meteorXtwo.toStringAsFixed(2) == (0.60).toString() ||
          meteorXtwo.toStringAsFixed(2) == (0.55).toString();
      var starPoint = starXtwo.toStringAsFixed(2) == (0.50).toString() ||
          starXtwo.toStringAsFixed(2) == (0.45).toString() ||
          starXtwo.toStringAsFixed(2) == (0.40).toString();

      var catPoints = catY == 0.6 || catY == 0.7 || catY == 0.65;
      if (starPoint && catPoints) {
        points += 5;
      }

      if (catDies && meteorDies) {
        timer.cancel();
        Navigator.pushReplacementNamed(context, Formulario.nomeRota,
            arguments: {points});
      }
    });
  }

  @override
  void initState() {
    runGame();
    super.initState();
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
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.only(right: 100),
                    child: Stack(
                      alignment: Alignment(0, catY),
                      children: [
                        MyCat(),
                        AnimatedContainer(
                          alignment: Alignment(meteorXtwo, -0.7),
                          duration: const Duration(milliseconds: 0),
                          child: Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    'lib/assets/images/meteor.png',
                                  ),
                                ),
                              ),
                              width: 80,
                              height: 80),
                        ),
                        AnimatedContainer(
                          alignment: Alignment(starXtwo, 0.6),
                          duration: const Duration(milliseconds: 0),
                          child: Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    'lib/assets/images/star.png',
                                  ),
                                ),
                              ),
                              width: 40,
                              height: 40),
                        ),
                      ],
                    ),
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
      ),
    );
  }
}
