import 'package:flutter/material.dart';
import './my_homepage.dart';

class Sobre extends StatefulWidget {
  static const nomeRota = '/nomeRota';

  const Sobre({Key? key}) : super(key: key);

  @override
  State<Sobre> createState() => _SobreState();
}

class _SobreState extends State<Sobre> {
  void onPressed() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyHomePage()));
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
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Text(
            'Créditos',
            style: TextStyle(
                fontFamily: 'Silkscreen',
                color: Colors.white,
                decoration: TextDecoration.none),
          ),
          const Text(
              'ESSE JOGO FOI DESENVOLVIDO POR INAE E LETÍCIA PARA A DISPCIPLINA DE PROGRAMAÇÃO PARA DISPOSITIVOS MÓVEIS DO CURSO DE ANÁLISE E DESENVOLVIMENTO DE SISTEMAS DO IFRS CAMPUS OSÓRIO ',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.none,
                fontSize: 14,
                fontFamily: 'Silkscreen',
              )),
          ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 255, 7, 181)),
              child: const Icon(Icons.keyboard_arrow_left_rounded))
        ],
      ),
    );
  }
}
