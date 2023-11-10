import 'package:flutter/material.dart';
import 'package:para/screens/perfil_screen.dart';
import 'package:para/theme/style.dart';

class DrawerPara extends StatefulWidget {
  const DrawerPara({super.key});

  @override
  DrawerParaState createState() => DrawerParaState();
}

class DrawerParaState extends State<DrawerPara> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        // Importante: elimina cualquier padding del encabezado.
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text('Nombre del Usuario'),
            accountEmail: Text('correo@ejemplo.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  '/assets/brain1.png'), // Añade la URL de la imagen del usuario
            ),
            decoration: BoxDecoration(
              color: Style.primaryColor,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Perfil'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.bookmark_border),
            title: const Text('Guardados'),
            onTap: () {
              // Actualiza el estado del índice y cierra el drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Sobre nosotros'),
            onTap: () {
              // Actualiza el estado del índice y cierra el drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.token_outlined),
            title: const Text('Consumo de tokens y API'),
            onTap: () {
              // Actualiza el estado del índice y cierra el drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.verified_outlined),
            title: const Text('PARA premium'),
            onTap: () {
              // Actualiza el estado del índice y cierra el drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Ajustes'),
            onTap: () {
              // Actualiza el estado del índice y cierra el drawer
              Navigator.pop(context);
            },
          ),
          // Añade aquí más ListTile según sea necesario
        ],
      ),
    );
  }
}
