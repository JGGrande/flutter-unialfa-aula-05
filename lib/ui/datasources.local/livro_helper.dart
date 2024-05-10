import 'package:aula05/ui/datasources.local/banco_dados.dart';
import 'package:aula05/ui/datasources.local/editora_helper.dart';
import 'package:aula05/ui/models/editora.dart';
import 'package:aula05/ui/models/livro.dart';
import 'package:sqflite/sqflite.dart';

class LivroHelper {
  static const createSql = """
    CREATE TABLE IF NOT EXISTS livro(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT,
      preco REAL,
      editora INTEGER,
      FOREIGN  KEY (editora) REFERENCES editora(id)
    );
  """;

  Future<Livro> insert(Livro livro) async{
    Database db = await BancoDados().db;

    livro.id = await db.insert("livro", livro.toMap());

    db.close();

    return livro;
  }

  Future<int> update(Livro livro) async {
    Database db = await BancoDados().db;

    int afetados = await db.update("livro", livro.toMap(),
        where: "id = ?",
        whereArgs: [ livro.id ]
    );

    db.close();

    return afetados;
  }

  Future<int> delete(int id) async{
    Database db = await BancoDados().db;

    int afetados = await db.delete("livro",
        where: "id = ?",
        whereArgs: [ id ]
    );

    db.close();

    return afetados;
  }

  Future<List<Livro>> getByEditora(int id) async{
    Editora? editora = await EditoraHelper().getById(id);

    if(editora != null){
      Database db = await BancoDados().db;

      List dados = await db.query("livro",
        where: "editora = ?",
        whereArgs: [ id ],
        orderBy: "nome"
      );

      return dados.map((e) => Livro.fromMap(e, editora)).toList();
    }

    return [];
  }




}