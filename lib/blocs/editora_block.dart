import 'package:aula05/ui/datasources.local/editora_helper.dart';
import 'package:aula05/ui/models/editora.dart';
import 'package:aula05/ui/pages/home_page.dart';
import 'package:aula05/ui/widgets/mensagem_alerta.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditoraBloc {
  final BuildContext context;
  final _editoraHelper = EditoraHelper();
  final nomeController = TextEditingController();

  EditoraBloc(this.context);

  Future<List<Editora>> getTodos() =>  _editoraHelper.getAll();

  Future<void> salvar() async{
    if(nomeController.text.trim().isEmpty){
      MensagemAlerta.show(
        context: context,
        titulo: "Atenção",
        texto: "O nome editora é obrigatório!",
      );

      return;
    }
    await _editoraHelper.insert(
      Editora(nome: nomeController.text)
    );

    Navigator.pop(context);
  }




}