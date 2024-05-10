import 'package:aula05/ui/extension/string_extension.dart';
import 'package:aula05/ui/models/editora.dart';

class Livro {
  int? id;
  String nome;
  double preco;
  Editora editora;

  Livro({ this.id, required this.nome, required this.preco, required this.editora });

  factory Livro.fromMap(Map map, Editora editora){
    return Livro(
        id: map['id'].toString().toInt(),
        nome: map['nome'],
        preco: map['preco'].toString().toDouble(),
        editora: editora,
    );
  }

  Map<String, dynamic> toMap(){
    return {
      "id": id,
      "nome": nome,
      "preco": preco,
      "editora": editora.id
    };
  }
}