import 'package:aula05/blocs/editora_block.dart';
import 'package:aula05/ui/widgets/botao_quadrado.dart';
import 'package:aula05/ui/widgets/campo_texto.dart';
import 'package:aula05/ui/widgets/title_bar.dart';
import 'package:flutter/material.dart';

class CadEditoraPage extends StatefulWidget {
  const CadEditoraPage({super.key});

  @override
  State<CadEditoraPage> createState() => _CadEditoraPageState();
}

class _CadEditoraPageState extends State<CadEditoraPage> {
  @override
  Widget build(BuildContext context) {
    final _editoraBloc = EditoraBloc(context);

    return Placeholder(
      child: Scaffold(
        appBar: TitleBar().show("Castro de editora"),
        body: Column(
          children: [
            CampoTexto(controller: _editoraBloc.nomeController, texto: "Nome",),
            BotaoQuadrado(
              clique: _editoraBloc.salvar,
              texto: "Salvar",
              cor: Colors.green[700],
            ),
            BotaoQuadrado(
              clique: (){ Navigator.pop(context); },
              texto: "Cancelar",
              cor: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
