import 'package:aula05/ui/datasources.local/editora_helper.dart';
import 'package:aula05/ui/models/editora.dart';

class EditoraBloc {
  final _editoraHelper = EditoraHelper();

  Future<List<Editora>> getTodos() =>  _editoraHelper.getAll();




}