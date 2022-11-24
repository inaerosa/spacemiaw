import 'package:flutter/material.dart';
import 'package:test/views/my_homepage.dart';
import 'package:test/util/validador.dart';
import 'package:test/model/jogador.dart';

import '../dbHelper/mongodb.dart';

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
    final Set dados = ModalRoute.of(context)!.settings.arguments as Set;

    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.center,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/assets/images/fundo.gif'),
                fit: BoxFit.fill)),
        child: Form(
          key: _formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'FIM\nDE\nJOGO',
                  textAlign: TextAlign.center,
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
                const Text('PONTUAÇAO',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Silkscreen',
                      color: Colors.white,
                    )),
                Text("${dados.first}",
                    style: const TextStyle(
                      fontSize: 30,
                      fontFamily: 'Silkscreen',
                      color: Colors.white,
                    )),
                const Text('INSIRA O NOME',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Silkscreen',
                      color: Colors.white,
                    )),
                SizedBox(
                  width: 200,
                  child: TextFormField(
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Silkscreen'),
                    cursorColor: Color.fromARGB(255, 255, 7, 181),
                    controller: controllerNome,
                    decoration: const InputDecoration(
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
                    maxLength: 3,
                    validator: Validador.validarNome(),
                  ),
                ),
                ElevatedButton(
                    onPressed: inserir,
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 255, 7, 181)),
                    child: const Text('salvar')),
                ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 255, 7, 181)),
                    child: const Icon(Icons.keyboard_arrow_left_rounded))
              ]),
        ),
      ),
    );
  }

  inserir() async {
    _formKey.currentState!.save();
    await MongoDatabase.insert(controllerNome.text, "30");
  }
}
