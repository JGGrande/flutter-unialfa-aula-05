import 'package:aula05/blocs/editora_block.dart';
import 'package:aula05/ui/models/editora.dart';
import 'package:aula05/ui/pages/cad_editora_page.dart';
import 'package:aula05/ui/pages/livro_page.dart';
import 'package:aula05/ui/widgets/circulo_espera.dart';
import 'package:aula05/ui/widgets/item_list.dart';
import 'package:aula05/ui/widgets/mensagem_erro.dart';
import 'package:aula05/ui/widgets/title_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final _editoraBloc = EditoraBloc(context);

    return Placeholder(
      child: Scaffold(
        appBar: TitleBar().show("Editoras"),
        floatingActionButton: FloatingActionButton(
          onPressed: () { _abrirCadastro(); },
          child: const Icon(Icons.add_business),
        ),
        body: FutureBuilder(
          future: _editoraBloc.getTodos(),
          builder: (context, snapshot) {
            switch(snapshot.connectionState){
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const CirculoEsfera();
              default:
                if(snapshot.hasError){
                  return MensagemErro(texto: snapshot.error.toString());
                }
                return _criarLista(snapshot.data!);
            }
          },
        ),
      ),
    );
  }

  Widget _criarLista(List<Editora> listaEditoras){
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        //direção do scroll
        scrollDirection: Axis.vertical,
        //tamanho da lista
        itemCount: listaEditoras.length,
        // executa a cada item do array
        itemBuilder: (context, index) => _criarItem(listaEditoras[index])
    );
  }

  Widget _criarItem(Editora editora){
    return ItemList(
        tiulo: editora.nome,
        cliqueLongo: (){ _abrirCadastro(editora: editora); },
        clique: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => LivroPage(editora))
          );
        },
    );
  }
  
  void _abrirCadastro({ Editora? editora }) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CadEditoraPage(editora: editora))
    );

    setState(() {

    });
  }

}
