import 'package:flutter/material.dart';
import '../../../screens/Home/home_page.dart';
import '../../../screens/Popular/popular_page.dart';
import '../../../screens/search/search_screen_one.dart';
import '../../../models/user_model.dart';

void displayDrawer(BuildContext context) {
  Scaffold.of(context).openDrawer();
}

void displayEndDrawer(BuildContext context) {
  Scaffold.of(context).openEndDrawer();
}

final items = ['Siguiendo', '↗ Popular', 'Para ti', 'Contra ti'];
String value = items[0];
String? currentValue;

AppBar buildHomeBar(text) {
  currentValue = text;
  if (currentValue != null) {
    if (currentValue == 'Home') {
      value = items[0];
    } else {
      value = items[1];
    }
  }
  return AppBar(
    title: const Text('Home'),
    centerTitle: false,
    leading: Builder(builder: (context) {
      return IconButton(
        key: const ValueKey('leftbannel_ToolBar'),
        icon: const Icon(Icons.menu),
        onPressed: () => Scaffold.of(context).openDrawer(),
      );
    }),
    actions: [
      Builder(builder: (context) {
        return DropdownButton(
            key: const ValueKey('dropdown_ToolBar'),
            value: value,
            iconEnabledColor: Colors.amberAccent,
            items: items.map(buildMenuItem).toList(),
            onChanged: (value) {
              if (value?.split(' ')[1] == 'Home' && currentValue != 'Home') {
                Navigator.of(context)
                    .pushReplacementNamed(HomePage.routeName, arguments: {});
                // print(value);
              } else if (value?.split(' ')[1] == 'Popular' &&
                  currentValue != 'Popular') {
                Navigator.of(context)
                    .pushReplacementNamed(Popular.routeName, arguments: {});
                // print(value);
              }
            });
      }),
      Builder(builder: (context) {
        return IconButton(
          key: const ValueKey('search_ToolBar'),
          onPressed: () {
            Navigator.of(context)
                .pushReplacementNamed(SearchScreenOne.routeName, arguments: {});
          },
          icon: const Icon(Icons.search),
        );
      }),
      IconButton(
        key: const ValueKey('add_ToolBar'),
        onPressed: () {
          // Routemaster.of(context).push('/add-post');
        },
        icon: const Icon(Icons.add),
      ),
      Builder(builder: (context) {
        return IconButton(
          key: const ValueKey('righttbannel_ToolBar'),
          icon: CircleAvatar(
            backgroundImage: NetworkImage(currentUser?.avatar ??
                'data:image/jpeg;base64,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'),
          ),
          onPressed: () => Scaffold.of(context).openEndDrawer(),
        );
      }),
    ],
  );
}

DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
