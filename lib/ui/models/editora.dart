import 'package:aula05/ui/extension/string_extension.dart';

class Editora {
  int? id;
  String nome;

  Editora({ this.id, required this.nome });

  factory Editora.fromMap(Map map){
    return Editora(
      id: map['id'].toString().toInt(),
      nome: map['nome']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "nome": nome
    };
  }
}