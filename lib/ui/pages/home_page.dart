import 'package:aula05/blocs/editora_block.dart';
import 'package:aula05/ui/models/editora.dart';
import 'package:aula05/ui/widgets/title_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final _editoraBloc = EditoraBloc();

    return Placeholder(
      child: Scaffold(
        appBar: TitleBar().show("Editoras"),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add_business),
        ),
        body: FutureBuilder(
          future: _editoraBloc.getTodos(),
          builder: (context, snapshot) {
            switch(snapshot.connectionState){
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              default:
                if(snapshot.hasError){
                  return Text(snapshot.error.toString());
                }
                return _criarLista(snapshot.data!);
            }
          },
        ),
      ),
    );
  }
  Widget _criarLista(List<Editora> listaEditoras){
    return Container(

    );
  }
}
