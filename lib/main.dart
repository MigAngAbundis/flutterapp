import 'package:flutter/material.dart';
import 'package:para/screens/navigation_screen.dart';
import 'package:para/theme/style.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Combined App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Style.secundaryBackgroundColor,
        primaryColor: Style.primaryColor,
        fontFamily: 'Roboto',
        primarySwatch: Colors.deepPurple,
        splashColor: Colors.black,
      ),
      home: const NavigationScreen(),
    );
  }
}
