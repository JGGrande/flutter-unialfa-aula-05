import 'package:aula05/ui/widgets/botao_quadrado.dart';
import 'package:aula05/ui/widgets/botao_texto.dart';
import 'package:flutter/material.dart';

class MensagemAlerta {

  static Future show({
    required BuildContext context,
    required String titulo,
    required String texto,
  }){
    return showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: Text(titulo),
            content: Text(texto),
            actions: [
              BotaoTexto(
                  texto: "OK",
                  clique: (){
                  Navigator.pop(context);
                }
              )
            ],
          );
        }
    );
  }

}