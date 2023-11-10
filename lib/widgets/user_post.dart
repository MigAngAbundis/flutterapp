import 'package:flutter/material.dart';
import 'package:para/theme/style.dart';

class UserPost extends StatefulWidget {
  final String name;
  final String image;

  const UserPost({Key? key, required this.name, required this.image})
      : super(key: key);

  @override
  UserPostState createState() => UserPostState();
}

class UserPostState extends State<UserPost> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.grey[200],
          padding: EdgeInsets.only(bottom: 8),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.grey[300]),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "8 horas",
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ]),
              IconButton(
                icon: Icon(Icons.more_horiz),
                onPressed: () {
                  // Implement the downvote functionality
                },
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 12, 12),
          child: RichText(
              text: const TextSpan(children: [
            TextSpan(
                text:
                    "Flutter offer a widget called the Bottomsheet which you can use by called the showModalBottomSheet. In This video you will learn how to use this Flutter BottomSheet Widget in a real life app. To learn more flutter widget like this one, check our flutter every widget series on the channel. The full flutter all ")
          ])),
        ),
        Container(
            color: Colors.grey[300],
            child: Image(
              image: NetworkImage(widget.image),
              fit: BoxFit.cover,
            )),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.favorite_outline),
                      onPressed: () {
                        // Implement the downvote functionality
                      },
                    ),
                    const Text("554"),
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      icon: const Icon(Icons.chat_bubble_outline),
                      onPressed: () {
                        // Implement the downvote functionality
                      },
                    ),
                    const Text("230"),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () {
                    // Implement the downvote functionality
                  },
                )
              ],
            ))
      ],
    );
  }
}
