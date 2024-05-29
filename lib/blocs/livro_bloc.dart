import 'package:aula05/ui/datasources.local/livro_helper.dart';
import 'package:aula05/ui/extension/string_extension.dart';
import 'package:aula05/ui/models/editora.dart';
import 'package:aula05/ui/models/livro.dart';
import 'package:aula05/ui/widgets/botao_quadrado.dart';
import 'package:aula05/ui/widgets/botao_texto.dart';
import 'package:aula05/ui/widgets/mensagem_alerta.dart';
import 'package:aula05/ui/widgets/mensagem_popup.dart';
import 'package:flutter/material.dart';

class LivroBloc {
  final BuildContext context;
  final Editora editora;
  final Livro? livro;

  final nomeController = TextEditingController();
  final precoConroller = TextEditingController();
  final _livroHelper = LivroHelper();

  LivroBloc({ required this.context, required this.editora, this.livro }){
    if(livro != null){
      nomeController.text = livro!.nome;
      precoConroller.text = livro!.preco.toString();
    }
  }

  Future<List<Livro>> getByEditora(int idEditora){
    return _livroHelper.getByEditora(idEditora);
  }

  void salvar() async {
    if(nomeController.text.trim().isEmpty){
      MensagemAlerta.show(
          context: context,
          titulo: "Atenção",
          texto: "O nome do livro é obrigatório."
      );
      return;
    }

    if(precoConroller.text.toDouble(valueDefault: -1) <= 0){
      MensagemAlerta.show(
          context: context,
          titulo: "Atenção",
          texto: "O preço do livro é obrigatório."
      );
      return;
    }

    if(livro == null){
      await _livroHelper.insert(Livro(
          nome: nomeController.text,
          preco: precoConroller.text.toDouble(),
          editora: editora
      ));
    }else{
      livro!.nome = nomeController.text;
      livro!.preco = nomeController.text.toDouble();

      await _livroHelper.update(livro!);
    }

    Navigator.pop(context);
  }

  void excluir(){
    MensagemPopup.show(
        context: context,
        titulo: "Atenção",
        texto: "Deseja realmente excluir esse Livro?",
        botoes: [
          BotaoQuadrado(texto: "Sim", clique: _confirmarExcluir, cor: Colors.red,),
          BotaoTexto(texto: "Não", clique: (){ Navigator.pop(context); })
        ]
    );
  }

  void _confirmarExcluir() async {
    if(livro != null){
      await _livroHelper.delete(livro!.id ?? 0);
    }
    Navigator.pop(context);
    Navigator.pop(context);
  }

}