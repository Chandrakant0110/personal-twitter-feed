// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import 'package:social_media_app/screens/comment_screen.dart';

class FeedCard extends StatelessWidget {
  final int index;
  final List<dynamic> apiData;
  const FeedCard({
    Key? key,
    required this.apiData,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> individualData = {};
    try {
      
      individualData =
          apiData[index]['content']['itemContent']['tweet_results']['result'];
    } catch (e) {
      print(e);
    }

    var accDetails = individualData['core']['user_results']['result']['legacy'];
    var tweetData = individualData['legacy'];

    String userName = '${accDetails['screen_name']}';
    String name = '${accDetails['name']}';
    String followersCount = '${accDetails['followers_count']}';
    String profileImageUrl = '${accDetails['profile_image_url_https']}';

    int likeCount = tweetData['favorite_count'];
    String tweetText = tweetData['full_text'];
    // String followers_count = accDetails['followers_count'];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(profileImageUrl),
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
                Text(
                  '@$userName',
                  style: const TextStyle(
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(tweetText),
            const Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LikeButton(
                    likeCount: likeCount,
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
