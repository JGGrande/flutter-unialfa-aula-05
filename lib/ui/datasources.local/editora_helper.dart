import 'package:aula05/ui/datasources.local/banco_dados.dart';
import 'package:aula05/ui/models/editora.dart';
import 'package:sqflite/sqflite.dart';

class EditoraHelper {
  static const createSql = """
    CREATE TABLE IF NOT EXISTS editora(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT
    );    
  """;

  Future<Editora> insert(Editora editora) async {
    Database db = await BancoDados().db;

    editora.id = await db.insert("editora", editora.toMap());

    db.close();

    return editora;
  }

  Future<int> update(Editora editora) async {
    Database db = await BancoDados().db;

    int afetados = await db.update("editora", editora.toMap(),
        where: "id = ?",
        whereArgs: [ editora.id ]
    );

    db.close();

    return afetados;
  }

  Future<int> delete(int id) async{
    Database db = await BancoDados().db;

    int afetados = await db.delete("editora",
        where: "id = ?",
        whereArgs: [ id ]
    );

    db.close();

    return afetados;
  }

  Future<List<Editora>> getAll() async {
    Database db = await BancoDados().db;

    List listaDados = await db.query('editora');

    db.close();

    return listaDados.map((e) => Editora.fromMap(e)).toList();
  }

  Future<Editora?> getById(int id) async {
    Database db = await BancoDados().db;

    List listaDados = await db.query('editora', where: 'id = ?', whereArgs: [id]);

    db.close();

    if(listaDados.isNotEmpty){
      return Editora.fromMap(listaDados.first);
    }

    return null;
  }

}