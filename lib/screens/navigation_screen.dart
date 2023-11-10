import 'package:flutter/material.dart';
import 'package:para/theme/style.dart';
import 'package:para/screens/home_screen.dart';
import 'package:para/screens/search_screen.dart';
import 'package:para/screens/create_screen.dart';
import 'package:para/screens/perfil_screen.dart';
import 'package:para/widgets/drawer_para.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const NavigationScreenStatefulWidget();
  }
}

class NavigationScreenStatefulWidget extends StatefulWidget {
  const NavigationScreenStatefulWidget({super.key});
  @override
  State<NavigationScreenStatefulWidget> createState() =>
      _NavigationScreenStatefulWidgetState();
}

class _NavigationScreenStatefulWidgetState
    extends State<NavigationScreenStatefulWidget> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SearchScreen(),
    CreatePostScreen(),
    ProfileScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _init(context);
  }

  void _init(context) async {}

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      if (index == 2) {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return const Wrap(
              children: [
                ListTile(
                  leading: Icon(Icons.share),
                  title: Text('Share'),
                ),
                ListTile(
                  leading: Icon(Icons.copy),
                  title: Text('Copy Link'),
                ),
                ListTile(
                  leading: Icon(Icons.edit),
                  title: Text('Edit'),
                ),
              ],
            );
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Style.secundaryBackgroundColor,
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Buscar',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle,
              ),
              label: 'Crear',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Perfil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          currentIndex: _selectedIndex,
          iconSize: 30.0,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Style.primaryColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: _onItemTapped,
        ));
  }
}
