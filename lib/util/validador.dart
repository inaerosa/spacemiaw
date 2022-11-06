import 'package:flutter/material.dart';

class Validador {
  static FormFieldValidator validarNome() {
    return (value) {
      String patttern = r'(^[a-zA-Z ]*$)';
      RegExp regExp = RegExp(patttern);
      if (value!.isEmpty) {
        return "Informe o nome";
      } else
        return null; // Passou na validação
    };
  }
}
