import 'package:flutter/material.dart';
import 'package:para/widgets/drawer_para.dart';
import 'package:para/widgets/user_post.dart';
import 'package:para/theme/style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Style.backgroundColor,
      endDrawer: SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: const DrawerPara()),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 0,
            pinned: true,
            floating: true,
            title: const Text(
              "PARA",
              style: TextStyle(
                  color: Style.primaryColor, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Style.backgroundColor,
            elevation: 10,
            centerTitle: false,
            titleSpacing: 20,
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                tooltip: 'Buscar',
                color: Style.text,
                onPressed: () {},
              ),
              const SizedBox(
                width: 10.0,
              ),
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                tooltip: 'Notificaciones',
                color: Style.text,
                onPressed: () {},
              ),
              const SizedBox(
                width: 10.0,
              ),
              IconButton(
                icon: const Icon(Icons.menu),
                tooltip: 'Menu',
                color: Style.text,
                onPressed: () {
                  scaffoldKey.currentState?.openEndDrawer();
                },
              ),
              const SizedBox(
                width: 20.0,
              ),
            ],
          ),
          const SliverToBoxAdapter(
            child: Column(
              children: [
                UserPost(
                  name: "Pedro Paramo",
                  image:
                      "https://glasgowguardian.co.uk/wp-content/uploads/sites/2/2019/03/memes_in_politics_sc.jpg",
                ),
                UserPost(
                  name: "El Cochiloco",
                  image:
                      "https://glasgowguardian.co.uk/wp-content/uploads/sites/2/2019/03/memes_in_politics_sc.jpg",
                ),
                UserPost(
                  name: "Juan Camaney",
                  image:
                      "https://glasgowguardian.co.uk/wp-content/uploads/sites/2/2019/03/memes_in_politics_sc.jpg",
                ),
                UserPost(
                  name: "Juan Camaney",
                  image:
                      "https://glasgowguardian.co.uk/wp-content/uploads/sites/2/2019/03/memes_in_politics_sc.jpg",
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
