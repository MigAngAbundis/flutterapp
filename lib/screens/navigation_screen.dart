import 'package:flutter/material.dart';
import 'package:para/models/user_model.dart';
import 'package:para/screens/add_post/add_post_screen_one.dart';
import 'package:para/screens/add_post/add_post_screen_three.dart';
import 'package:para/screens/add_post/add_post_screen_two.dart';
import 'package:para/screens/notifications_screen.dart';
import 'package:para/screens/search/search_screen_one.dart';
import 'package:para/screens/search/search_screen_two.dart';
import 'package:para/theme/style.dart';
import 'package:para/screens/home_screen.dart';
import 'package:para/screens/base_screen.dart';
import 'package:para/screens/Home/home_page.dart';

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

  final pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.secundaryBackgroundColor,
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: <Widget>[
          HomeScreen(),
          SearchScreenOne(),
          AddPostScreenOne(),
          BaseScreen(),
          NotificationScreen(),
        ],
        physics: NeverScrollableScrollPhysics(), // Disable swipe to change tabs
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
            icon: Icon(Icons.add_circle),
            label: 'Crear',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Base',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: 'Notificaciones',
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
      ),
    );
  }
}
