import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  final String tiulo;
  final VoidCallback? clique;
  final VoidCallback? cliqueLongo;
  final VoidCallback? arrastaParaCima;
  final List<Widget>? listaAcoes;

  const ItemList({
    required this.tiulo,
    this.clique,
    this.cliqueLongo,
    this.arrastaParaCima,
    this.listaAcoes ,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: clique,
        onLongPress: cliqueLongo,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(tiulo),
                Row(children: listaAcoes ?? [])
              ],
            ),
        ),
      )
    );
  }
}
