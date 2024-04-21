// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import 'package:social_media_app/screens/comment_screen.dart';

class FeedCard extends StatelessWidget {
  final dynamic apiData;
  const FeedCard({
    Key? key,
    required this.apiData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accDetails = apiData['core']['user_results']['result']['legacy'];
    var tweetData = apiData['legacy'];

    String name = accDetails['screen_name'];
    String followers_count = accDetails['followers_count'];
// String
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.black45,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  '@username',
                  style: TextStyle(
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Text('Tweet Details'),
            const Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const LikeButton(
                    likeCount: 250,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CommentScreen(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.comment,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
