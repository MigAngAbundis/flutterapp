import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: ProfileScreen()));
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
    final double appBarHeight =
        MediaQuery.of(context).size.height * 0.5; // 50% of screen height
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: AppBar(
          backgroundColor: Colors.deepPurple,
          leading: BackButton(color: Colors.white),
          flexibleSpace: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              var topPadding = MediaQuery.of(context).padding.top;
              var avatarRadius = 60.0;
              var appBarHeight = constraints.biggest.height - topPadding;
              return Padding(
                padding: EdgeInsets.fromLTRB(
                    16, topPadding + avatarRadius / 2, 16, 0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: avatarRadius, // Size of the avatar
                          backgroundColor: Colors.deepPurple
                              .shade300, // Placeholder for the actual image
                        ),
                        IconButton(
                          icon: Icon(CupertinoIcons.chat_bubble,
                              color: Colors.white),
                          onPressed: () {},
                        ),
                        ElevatedButton(
                          child: Text('Seguir'),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.more_vert, color: Colors.white),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    if (appBarHeight >
                        avatarRadius * 3) // Ensure there's enough space
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'david-dillinger',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              'hi im david and i like videogames',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.white70),
                            ),
                            Text(
                              'Karma Count: 9',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.white70),
                            ),
                            Text(
                              'Joined: 21/03/2022',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      body: Column(
        children: [
          Material(
            color: Colors.deepPurple,
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
              ),
              tabs: [
                Tab(text: 'Posts'),
                Tab(text: 'Comentarios'),
                Tab(text: 'Acerca de'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Center(child: Text('Posts content goes here')),
                Center(child: Text('Comments content goes here')),
                Center(child: Text('About content goes here')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
