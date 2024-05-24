import 'package:aula05/ui/datasources.local/livro_helper.dart';
import 'package:aula05/ui/models/livro.dart';

class LivroBloc {
  final _livroHelper = LivroHelper();

  Future<List<Livro>> getByEditora(int idEditora){
    return _livroHelper.getByEditora(idEditora);
  }

}