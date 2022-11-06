import 'package:flutter/material.dart';
import 'package:test/views/my_homepage.dart';
import 'package:test/util/validador.dart';
import 'package:test/model/jogador.dart';

class Formulario extends StatefulWidget {
  static const nomeRota = "/formulario";

  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final _formKey = GlobalKey<FormState>();
  void onPressed() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }

  Jogador? jogador = Jogador();
  final controllerNome = TextEditingController();

  @override
  void dispose() {
    controllerNome.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controllerNome.addListener(() {
      jogador?.nome = controllerNome.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.center,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/assets/images/fundo.gif'),
                fit: BoxFit.fill)),
        child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text(
                ' \n\n FIM\n  DE\nJOGO',
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
              const Text('\nPONTUAÇAO',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Silkscreen',
                    color: Colors.white,
                  )),
              const Text('\n\nINSIRA O NOME',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Silkscreen',
                    color: Colors.white,
                  )),
              TextFormField(
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Silkscreen'),
                cursorColor: Color.fromARGB(255, 255, 7, 181),
                controller: controllerNome,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color.fromARGB(255, 255, 7, 181),
                    width: 2,
                  )),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.white,
                    width: 2,
                  )),
                  filled: true,
                ),
                maxLength: 5,
                validator: Validador.validarNome(),
              ),
              ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 255, 7, 181)),
                  child: const Icon(Icons.keyboard_arrow_left_rounded))
            ]),
      ),
    );
  }
}
