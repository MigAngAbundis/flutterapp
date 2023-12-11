import 'package:flutter/material.dart';
import '../../widgets/drawers/right_drawer.dart';

///temp drawers home to develop and test the drawers
class DrawerHome extends StatelessWidget {
  const DrawerHome({super.key});

  ///temp drawers home's route name
  static const routeName = '/drawer_home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text("drawers Homepage")),
      appBar: AppBar(
        title: const Text("Home page"),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: rightDrawer(context),
    );
  }
}
