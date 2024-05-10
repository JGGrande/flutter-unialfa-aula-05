extension StringExtension on String {
  int toInt({ int vlrPadrao = 0 }) {
    return int.tryParse(this) ?? vlrPadrao;
  }

  double toDouble({ double valueDefault = 0.0 }){
    return double.tryParse(this) ?? valueDefault;
  }
}