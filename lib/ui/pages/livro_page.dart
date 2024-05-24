import 'package:aula05/blocs/livro_bloc.dart';
import 'package:aula05/ui/models/editora.dart';
import 'package:aula05/ui/models/livro.dart';
import 'package:aula05/ui/widgets/circulo_espera.dart';
import 'package:aula05/ui/widgets/mensagem_erro.dart';

import 'package:aula05/ui/widgets/title_bar.dart';
import 'package:flutter/material.dart';

class LivroPage extends StatefulWidget {
  final Editora editora;

  const LivroPage(this.editora, {super.key});

  @override
  State<LivroPage> createState() => _LivroPageState();
}

class _LivroPageState extends State<LivroPage> {
  @override
  Widget build(BuildContext context) {
    final _bloc = LivroBloc();

    return Placeholder(
      child: Scaffold(
        appBar: TitleBar().show('Livros - ${widget.editora.nome}'),
        floatingActionButton: FloatingActionButton(
          onPressed: _abrirCadastro,
          child: const Icon(Icons.book_online),
        ),
        body: FutureBuilder(
          future: _bloc.getByEditora(widget.editora.id ?? 0),
          builder: (context, snapshot) {
            switch(snapshot.connectionState){
              case ConnectionState.waiting:
              case ConnectionState.none:
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

  void _abrirCadastro({ Livro? livro }){

  }

  Widget _criarLista(List<Livro> lista){
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: lista.length,
      itemBuilder: (context, index){
        return Text(lista[index].nome);
      },
    );
  }

}
