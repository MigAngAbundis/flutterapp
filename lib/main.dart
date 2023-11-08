import 'package:flutter/material.dart';
import 'screens/search_screen.dart';
import 'screens/create_screen.dart';
import 'screens/base_screen.dart';
import 'screens/notifications_screen.dart';
import 'screens/perfil_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/Myhome_page': (context) => const MyHomePage(),
        '/Search_screen': (context) => const MyHomePage(),
        '/Create_page': (context) => const CreatePostScreen(),
        '/Bases_creen': (context) => const MyHomePage(),
        '/Profile_screen': (context) => const ProfileScreen(),
        '/Notifications': (context) => const NotificationsScreen(),
      },
      title: 'Flutter Combined App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(),
    );
  }
}

List<Map<String, dynamic>> postsData = [
  // Aquí incluir la lista de publicaciones con su información.
  {
    'title': 'Post 1',
    'subreddit': 'FlutterDev',
    'upvotes': 10,
    'downvotes': 2,
    'comments': 50
  },
  {
    'title': 'Post 2',
    'subreddit': 'Dart',
    'upvotes': 5,
    'downvotes': 1,
    'comments': 20
  }
];

class RedditTile extends StatefulWidget {
  final String title;
  final String subreddit;
  final int commentsCount;

  const RedditTile({
    super.key,
    required this.title,
    required this.subreddit,
    required this.commentsCount,
  });

  @override
  RedditTileState createState() => RedditTileState();
}

class RedditTileState extends State<RedditTile> {
  int currentUpvotes = 0;
  int currentDownvotes = 0;

  void _navigateToThreadedComments(BuildContext context, String postTitle) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            ThreadedCommentsPage(postData: {'title': 'hello'}),
      ),
    );
    print('Navigating to threaded comments...');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(widget.title), // Use data passed through the widget
            subtitle: Text('/r/${widget.subreddit}'),
            trailing: PopupMenuButton<String>(
              onSelected: (String value) {
                // Implement what happens when an option is selected
                switch (value) {
                  case 'More information':
                    // Implement this functionality
                    break;
                  case 'Denounce post':
                    // Implement this functionality
                    break;
                  // Add cases for each menu option
                  // ...
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'More information',
                  child: Text('More information'),
                ),
                const PopupMenuItem<String>(
                  value: 'Denounce post',
                  child: Text('Denounce post'),
                ),
                // Add entries for each menu option
                // ...
              ],
            ),
          ),
          Row(
            // Existing code...
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              // ... existing buttons
              IconButton(
                icon: Icon(Icons.arrow_upward),
                onPressed: () {
                  setState(() {
                    currentUpvotes++;
                  });
                  // Implement the upvote functionality
                },
              ),
              Text('$currentUpvotes'), // Display the current upvote count
              IconButton(
                icon: Icon(Icons.arrow_downward),
                onPressed: () {
                  setState(() {
                    currentDownvotes++;
                  });
                  // Implement the downvote functionality
                },
              ),
              IconButton(
                icon: Icon(Icons.comment),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ThreadedCommentsPage(
                        postData: {
                          'title': widget.title,
                          'subreddit': widget.subreddit,
                          'upvotes': currentUpvotes,
                          'downvotes': currentDownvotes,
                          // Include any additional post data needed
                        },
                      ),
                    ),
                  );
                },
              ),

              Text('${widget.commentsCount} comments'),
              // ... existing buttons
            ],
          ),
        ],
      ),
    );
  }
}

class ThreadedCommentsPage extends StatefulWidget {
  final Map<String, dynamic> postData;

  const ThreadedCommentsPage({Key? key, required this.postData})
      : super(key: key);

  @override
  _ThreadedCommentsPageState createState() => _ThreadedCommentsPageState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments for $postData'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(title: Text('Comment 1')),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: ListTile(title: Text('Reply to Comment 1')),
          ),
          ListTile(title: Text('Comment 2')),
          // Add more comments and nested replies as needed
        ],
      ),
    );
  }
}

class _ThreadedCommentsPageState extends State<ThreadedCommentsPage> {
  int currentUpvotes = 0;
  int currentDownvotes = 0;
  String postTitle = 'hwie you';

  @override
  void initState() {
    super.initState();
    currentUpvotes = widget.postData['upvotes'];
    currentDownvotes = widget.postData['downvotes'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments for ${widget.postData['title']}'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: Column(
              children: [
                ListTile(
                  title: Text(widget.postData['title']),
                  subtitle: Text('/r/${widget.postData['subreddit']}'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_upward),
                      onPressed: () => setState(() => currentUpvotes++),
                    ),
                    Text('$currentUpvotes Upvotes'),
                    IconButton(
                      icon: Icon(Icons.arrow_downward),
                      onPressed: () => setState(() => currentDownvotes++),
                    ),
                    Text('$currentDownvotes Downvotes'),
                  ],
                ),
              ],
            ),
          ),
          // ... (Your comments list here)
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _children = [
    const MyHomePage(),
    const SearchScreen(),
    const CreatePostScreen(),
    const BaseScreen(),
    const NotificationsScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscar'),
      ),
      drawer: Drawer(
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
                color: Colors.deepPurple,
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Perfil'),
              onTap: () {
                // Actualiza el estado del índice y cierra el drawer
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.bookmark_border),
              title: Text('Guardados'),
              onTap: () {
                // Actualiza el estado del índice y cierra el drawer
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('Sobre nosotros'),
              onTap: () {
                // Actualiza el estado del índice y cierra el drawer
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.token_outlined),
              title: Text('Consumo de tokens y API'),
              onTap: () {
                // Actualiza el estado del índice y cierra el drawer
                _onItemTapped(3);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.verified_outlined),
              title: Text('PARA premium'),
              onTap: () {
                // Actualiza el estado del índice y cierra el drawer
                _onItemTapped(4);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Ajustes'),
              onTap: () {
                // Actualiza el estado del índice y cierra el drawer
                _onItemTapped(5);
                Navigator.pop(context);
              },
            ),
            // Añade aquí más ListTile según sea necesario
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: postsData.length,
        itemBuilder: (BuildContext context, int index) {
          int commentsCount = postsData[index]['commentsCount'] ?? 0;

          return RedditTile(
            title: postsData[index]['title'],
            subreddit: postsData[index]['subreddit'],
            commentsCount: commentsCount,
            // Pasar los upvotes y downvotes si están disponibles
            // De lo contrario, serán cero por defecto
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        // Implementación del BottomNavigationBar aquí.
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black87), label: 'H'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.black87), label: 'V'),
          BottomNavigationBarItem(
            icon: Icon(Icons.add, color: Colors.black87),
            label: 'C',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.book_outlined, color: Colors.black87),
              label: 'B'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.black45), label: 'P'),
        ],
        currentIndex: _selectedIndex, // Esto debe ser actualizado
        selectedItemColor: Colors.purple[800],
        onTap: _onItemTapped, // Añade el callback aquí
      ),
    );
  }

  Widget _createDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            accountName: Text(
              "Miguel Abundis",
              style: TextStyle(color: Colors.black),
            ),
            accountEmail: Text(
              "@mikethorsexy",
              style: TextStyle(color: Colors.black),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/brain1.png'), // Replace with your image asset path
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Perfil'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ProfileScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Elementos guardados'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ProfileScreen()));
            },
          ),
          // Add other ListTiles here...
        ],
      ),
    );
  }
}
