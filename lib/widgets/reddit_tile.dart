import 'package:flutter/material.dart';

class RedditTile extends StatefulWidget {
  const RedditTile({super.key});

  @override
  RedditTileState createState() => RedditTileState();
}

class RedditTileState extends State<RedditTile> {
  int upvotes = 5;
  int downvotes = 3;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0), // Makes it rectangular
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                      '../assets/brain1.png'), // Replace with your image asset path
                ),
                SizedBox(width: 10), // Spacing between the avatar and the title
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Reddit Post Title",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("/r/subredditName",
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 10), // Space between title and action row
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_upward),
                  color: Colors.green,
                  onPressed: () {
                    setState(() {
                      upvotes += 1;
                    });
                  },
                ),
                Text('$upvotes'),
                IconButton(
                  icon: const Icon(Icons.arrow_downward),
                  color: Colors.red,
                  onPressed: () {
                    setState(() {
                      downvotes -= 1;
                    });
                  },
                ),
                Text('$downvotes'),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.comment),
                  onPressed: () {
                    // Comment functionality can be added here
                  },
                ),
                const Text('10 comments'), // Sample value
                IconButton(
                  icon: const Icon(Icons.repeat), // Repost button
                  onPressed: () {
                    // Repost functionality can be added here
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
