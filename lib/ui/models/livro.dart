import 'package:aula05/ui/models/editora.dart';

class Livro {
  int? id;
  String nome;
  double preco;
  Editora editora;

  Livro({ required this.nome, required this.preco, required this.editora });
}