import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  final String tiulo;
  const ItemList({required this.tiulo, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(tiulo),
      ),
    );
  }
}
