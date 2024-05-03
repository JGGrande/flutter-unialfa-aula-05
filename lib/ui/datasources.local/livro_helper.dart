class LivroHelper {
  static const createSql = """
    CREATE TABLE IF NOT EXISTS livro(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT,
      preco REAL,
      editora_id INTEGER,
      FOREIN KEY (editora) REFERENCES editora(id)
    );
  """;
}