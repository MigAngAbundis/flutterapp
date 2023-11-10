import 'package:flutter/material.dart';
import 'package:para/theme/style.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) => const CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 0,
            pinned: true,
            floating: true,
            title: Text(
              "Search",
              style: TextStyle(color: Style.title),
            ),
            backgroundColor: Style.secundaryBackgroundColor,
            elevation: 10,
            centerTitle: false,
            titleSpacing: 30,
            actions: [
              SizedBox(
                width: 20.0,
              ),
            ],
          ),
        ],
      );
}
