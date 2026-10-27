import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/item.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  static const List<Item> items = [
    Item(
      id: '1',
      titulo: 'Montañas al amanecer',
      descripcion: 'Un paisaje de montañas iluminadas por el sol.',
      urlImagen: 'https://picsum.photos/id/1018/400/300',
    ),
    Item(
      id: '2',
      titulo: 'Camino entre árboles',
      descripcion: 'Un sendero tranquilo rodeado de naturaleza.',
      urlImagen: 'https://picsum.photos/id/10/400/300',
    ),
    Item(
      id: '3',
      titulo: 'Lago cristalino',
      descripcion: 'Un lago rodeado de vegetación y calma.',
      urlImagen: 'https://picsum.photos/id/11/400/300',
    ),
    Item(
      id: '4',
      titulo: 'Arquitectura urbana',
      descripcion: 'Edificios modernos en el centro de la ciudad.',
      urlImagen: 'https://picsum.photos/id/12/400/300',
    ),
    Item(
      id: '5',
      titulo: 'Costa rocosa',
      descripcion: 'El mar golpeando suavemente las rocas.',
      urlImagen: 'https://picsum.photos/id/13/400/300',
    ),
    Item(
      id: '6',
      titulo: 'Bosque verde',
      descripcion: 'Una vista frondosa de un bosque en primavera.',
      urlImagen: 'https://picsum.photos/id/14/400/300',
    ),
    Item(
      id: '7',
      titulo: 'Desierto dorado',
      descripcion: 'Dunas de arena bajo un cielo despejado.',
      urlImagen: 'https://picsum.photos/id/15/400/300',
    ),
    Item(
      id: '8',
      titulo: 'Noche estrellada',
      descripcion: 'Un cielo nocturno lleno de estrellas.',
      urlImagen: 'https://picsum.photos/id/16/400/300',
    ),
    Item(
      id: '9',
      titulo: 'Campo de flores',
      descripcion: 'Flores de colores extendiéndose por el campo.',
      urlImagen: 'https://picsum.photos/id/17/400/300',
    ),
    Item(
      id: '10',
      titulo: 'Puente antiguo',
      descripcion: 'Un puente de piedra sobre un río.',
      urlImagen: 'https://picsum.photos/id/18/400/300',
    ),
    Item(
      id: '11',
      titulo: 'Cascada escondida',
      descripcion: 'Una cascada natural en un entorno montañoso.',
      urlImagen: 'https://picsum.photos/id/19/400/300',
    ),
    Item(
      id: '12',
      titulo: 'Pueblo costero',
      descripcion: 'Casas junto al mar en un día soleado.',
      urlImagen: 'https://picsum.photos/id/20/400/300',
    ),
    Item(
      id: '13',
      titulo: 'Llanura nevada',
      descripcion: 'Un paisaje cubierto completamente de nieve.',
      urlImagen: 'https://picsum.photos/id/21/400/300',
    ),
    Item(
      id: '14',
      titulo: 'Atardecer naranja',
      descripcion: 'Los últimos rayos del sol sobre el horizonte.',
      urlImagen: 'https://picsum.photos/id/22/400/300',
    ),
    Item(
      id: '15',
      titulo: 'Casa en el campo',
      descripcion: 'Una pequeña casa rodeada de árboles.',
      urlImagen: 'https://picsum.photos/id/23/400/300',
    ),
  ];

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
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'La visualización detallada se desarrollará en la Fase 3',
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  CachedNetworkImage(
                    imageUrl: item.urlImagen,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const SizedBox(
                      width: 100,
                      height: 100,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    errorWidget: (context, url, error) => const SizedBox(
                      width: 100,
                      height: 100,
                      child: Icon(Icons.image_not_supported),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.titulo,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(item.descripcion),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
