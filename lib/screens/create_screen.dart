import 'package:flutter/material.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Publicación'),
        actions: [
          TextButton(
            onPressed: () {
              // Función para el botón Siguiente
            },
            child: Text(
              'Siguiente',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            DropdownButtonFormField(
              items: [], // Agrega tus items aquí
              hint: Text('Add flair'),
              onChanged: (value) {},
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Add a title'),
            ),
            TextField(
              decoration:
                  InputDecoration(hintText: 'Cuerpo de texto(opcional)'),
            ),
            Divider(),
            Text('¿Qué quieres publicar?'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.text_fields),
                  onPressed: () {},
                ),
                // Agrega más botones para Enlace, Imagen, Video, etc.
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Chip(label: Text('#ArmasLegales')),
                  // Agrega más chips para otras etiquetas
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
