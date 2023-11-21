import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
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
        title: Text('Buzón'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Mensajes'),
            Tab(text: 'Notificaciones'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Aquí irían los widgets para cada tab, por ahora son simplemente Text widgets
          Center(child: Text('Mensajes')),
          Center(child: Text('Notificaciones')),
        ],
      ),
    );
  }
}
