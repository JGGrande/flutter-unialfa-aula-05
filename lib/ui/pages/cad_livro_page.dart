import 'package:aula05/blocs/livro_bloc.dart';
import 'package:aula05/ui/models/editora.dart';
import 'package:aula05/ui/models/livro.dart';
import 'package:aula05/ui/widgets/botao_quadrado.dart';
import 'package:aula05/ui/widgets/campo_texto.dart';
import 'package:aula05/ui/widgets/title_bar.dart';
import 'package:flutter/material.dart';

class CadLivroPage extends StatefulWidget {
  final Editora editora;
  final Livro? livro;
  const CadLivroPage({ required this.editora, this.livro, super.key});

  @override
  State<CadLivroPage> createState() => _CadLivroPageState();
}

class _CadLivroPageState extends State<CadLivroPage> {
  @override
  Widget build(BuildContext context) {
    final _bloc = LivroBloc(context: context, editora: widget.editora);

    return Placeholder(
      child: Scaffold(
        appBar: TitleBar().show("Cadastro de Liro"),
        body: Column(
          children: [
            CampoTexto(
              controller: _bloc.nomeController,
              texto: "Nome",
            ),
            CampoTexto(
              controller: _bloc.precoConroller,
              texto: "Preço",
              teclado: TextInputType.number,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BotaoQuadrado(
                  clique: _bloc.salvar,
                  texto: "Salvar",
                  cor: Colors.green[700],
                ),
                BotaoQuadrado(
                  clique: (){ Navigator.pop(context); },
                  texto: "Cancelar",
                  cor: Colors.deepOrange,
                ),
                widget.livro == null ? Container()
                    : BotaoQuadrado(
                  clique: _bloc.excluir,
                  texto: "Excluir",
                  cor: Colors.red[700],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
