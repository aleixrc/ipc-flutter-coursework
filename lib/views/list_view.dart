import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: const Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green),
                SizedBox(width: 12),
                Text('Navegación completada correctamente'),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: const Row(
              children: [
                Icon(Icons.list),
                SizedBox(width: 12),
                Text('Elemento de ejemplo 1'),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: const Row(
              children: [
                Icon(Icons.star),
                SizedBox(width: 12),
                Text('Elemento de ejemplo 2'),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: const Row(
              children: [
                Icon(Icons.done),
                SizedBox(width: 12),
                Text('Elemento de ejemplo 3'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
