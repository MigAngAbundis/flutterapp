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
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.75,
        child: const DrawerPara(),
      ),
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
            centerTitle: true,
            titleSpacing: 20,
            leading: Padding(
              padding: const EdgeInsets.only(
                  left:
                      14.0), // Adjust left padding to move the CircleAvatar a bit to the right
              child: InkWell(
                onTap: () {
                  scaffoldKey.currentState?.openDrawer();
                },
                child: CircleAvatar(
                  radius: 16, // Adjust the size by setting the radius
                  backgroundImage: NetworkImage(
                    'https://lopezobrador.org.mx/wp-content/uploads/2019/03/AMLO-Perfil-100Dias-300x300.jpg', // Replace with your actual image URL
                  ),
                ),
              ),
            ),
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
