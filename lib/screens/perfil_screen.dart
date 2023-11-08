import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Posts'),
            Tab(text: 'Comentarios'),
            Tab(text: 'Acerca de'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Aquí irían los widgets para cada tab, por ahora son simplemente Text widgets
          Center(child: Text('Posts')),
          Center(child: Text('Comentarios')),
          Center(child: Text('Acerca de')),
        ],
      ),
    );
  }
}
