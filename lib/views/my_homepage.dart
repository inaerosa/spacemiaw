import 'package:flutter/material.dart';
import './sobre.dart';
import './historia.dart';

class MyHomePage extends StatefulWidget {
  static const nomeRota = "/myhomepage";

  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void onPressed() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Sobre()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/assets/images/fundo.gif'),
              fit: BoxFit.fill)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Space Miaw',
            style: TextStyle(
                fontFamily: '1up',
                color: Colors.white,
                decoration: TextDecoration.none),
          ),
          Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Historia()));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 255, 7, 181)),
                  child: const Text('Começar jogo',
                      style: TextStyle(
                        fontFamily: 'Silkscreen',
                      ))),
              ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 255, 7, 181)),
                  child: const Text('Créditos',
                      style: TextStyle(fontFamily: 'Silkscreen')))
            ],
          )
        ],
      ),
    );
  }
}
