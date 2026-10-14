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
          tooltip: 'Volver',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text(
            'Navegación completada correctamente',
            style: TextStyle(fontSize: 22),
          ),
          SizedBox(height: 16),
          Text('Has llegado a ListViewScreen.'),
          SizedBox(height: 8),
          Text('Elemento de ejemplo 1'),
          SizedBox(height: 8),
          Text('Elemento de ejemplo 2'),
          SizedBox(height: 8),
          Text('Elemento de ejemplo 3'),
        ],
      ),
    );
  }
}
