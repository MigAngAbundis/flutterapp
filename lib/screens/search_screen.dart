import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // AppBar color
        titleSpacing: 0, // Remove any default horizontal spacing
        title: Padding(
          // Added padding around the Row
          padding: const EdgeInsets.symmetric(
              horizontal: 8.0), // Horizontal padding for the whole Row
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                // Example profile image
                backgroundImage:
                    NetworkImage('https://via.placeholder.com/150'),
                // Replace with your asset or network image
              ),
              SizedBox(width: 10), // Space between avatar and search bar
              Expanded(
                child: CupertinoSearchTextField(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              SizedBox(width: 10), // Space between search bar and button
              // Button with rounded corners and more stand-out style
              Material(
                color: Colors.white, // Button background color
                elevation: 2, // Shadow for the button
                borderRadius: BorderRadius.circular(10), // Rounded corners
                child: InkWell(
                  onTap: () {
                    // Action when the button is pressed
                  },
                  borderRadius:
                      BorderRadius.circular(10), // Match parent's border radius
                  child: Ink(
                    decoration: BoxDecoration(
                      color: Colors.blue, // Button inner color
                      borderRadius:
                          BorderRadius.circular(10), // Rounded corners
                    ),
                    child: Container(
                      width: 48, // Square button has equal width and height
                      height: 48,
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.add, // Example icon
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Include other widgets here
            // ...
          ],
        ),
      ),
    );
  }
}
