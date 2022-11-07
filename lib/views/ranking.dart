import 'package:flutter/material.dart';

import 'my_homepage.dart';

class Ranking extends StatefulWidget {
  static const nomeRota = "/Historia";

  _RankingState createState() => _RankingState();
}

class _RankingState extends State<Ranking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: AlignmentDirectional.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/images/fundo.gif'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text(
                'Placar',
                style: TextStyle(
                  fontSize: 50,
                  fontFamily: 'Silkscreen',
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Color.fromARGB(255, 255, 7, 181),
                      offset: Offset(5.0, 5.0),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text('1',
                      style: TextStyle(
                        fontFamily: 'Silkscreen',
                        color: Colors.white,
                      )),
                  const Text('Name',
                      style: TextStyle(
                        fontFamily: 'Silkscreen',
                        color: Colors.white,
                      )),
                  const Text('666',
                      style: TextStyle(
                        fontFamily: 'Silkscreen',
                        color: Colors.white,
                      )),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 255, 7, 181)),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyHomePage())),
                child: const Icon(Icons.keyboard_arrow_left_rounded),
              )
            ],
          )),
    );
  }
}
