import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final List<String> materiasYPoliticas = [
    'Materias oficiales',
    'Materias no oficiales',
    'Políticas oficiales',
    'Políticas no oficiales',
  ];

  final List<String> datos = [
    'Documentos',
    'Agentes',
    'Datos',
    'Frecuencia de palabras clave',
    'Memes',
    'RAQ',
  ];

  // Método para crear los títulos de las secciones alineados a la izquierda
  Widget sectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Método para construir las tarjetas
  Widget buildCard(String option) {
    return GestureDetector(
      onTap: () {
        // Aquí manejas la navegación a la pantalla de detalles
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(title: option),
          ),
        );
      },
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        margin: EdgeInsets.all(8.0),
        elevation: 4.0,
        child: Container(
          padding: EdgeInsets.all(16.0),
          alignment: Alignment.center,
          child: Text(
            option,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Estilos personalizados y widgets de DropdownButton van aquí ...

    return Scaffold(
      appBar: AppBar(
        title: Text('Base'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // ... Widgets de DropdownButton y otros widgets van aquí ...
              sectionTitle('Materias y políticas'),
              GridView.builder(
                physics:
                    NeverScrollableScrollPhysics(), // para evitar el desplazamiento dentro del GridView
                shrinkWrap:
                    true, // necesario para colocar dentro de un SingleChildScrollView
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                ),
                itemCount: materiasYPoliticas.length,
                itemBuilder: (context, index) {
                  return buildCard(materiasYPoliticas[index]);
                },
              ),
              sectionTitle('Datos'),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                ),
                itemCount: datos.length,
                itemBuilder: (context, index) {
                  return buildCard(datos[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String title;

  DetailScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('Detalles de $title'),
      ),
    );
  }
}
