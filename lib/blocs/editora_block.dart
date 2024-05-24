import 'package:aula05/ui/datasources.local/editora_helper.dart';
import 'package:aula05/ui/models/editora.dart';
import 'package:aula05/ui/pages/home_page.dart';
import 'package:aula05/ui/widgets/botao_quadrado.dart';
import 'package:aula05/ui/widgets/botao_texto.dart';
import 'package:aula05/ui/widgets/mensagem_alerta.dart';
import 'package:aula05/ui/widgets/mensagem_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditoraBloc {
  final BuildContext context;
  final Editora? editora;
  final _editoraHelper = EditoraHelper();
  final nomeController = TextEditingController();

  EditoraBloc(this.context, { this.editora }){
    nomeController.text = editora?.nome ?? '';
  }

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

    if(editora == null){
      await _editoraHelper.insert(
          Editora(nome: nomeController.text)
      );
    }else {
      editora!.nome = nomeController.text;
      await _editoraHelper.update(editora!);
    }

    Navigator.pop(context);
  }

  void excluir(){
    MensagemPopup.show(
        context: context,
        titulo: "Atenção",
        texto: "Deseja realmente excluir essa editora?",
        botoes: [
          BotaoQuadrado(texto: "Sim", clique: _confirmarExcluir, cor: Colors.red,),
          BotaoTexto(texto: "Não", clique: (){ Navigator.pop(context); })
        ]
    );
  }

  void _confirmarExcluir() async{
    if(editora != null) await _editoraHelper.delete(editora!.id ?? 0);

    Navigator.pop(context);
    Navigator.pop(context);
  }


}