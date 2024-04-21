import 'package:flutter/material.dart';
import 'package:social_media_app/api/api_call.dart';
import 'package:social_media_app/widgets/feed_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  dynamic data;
  @override
  void initState() {
    data = await API
        .getTweets(); // Get tweet data from the server when the screen is opened
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Personal Twitter Tweets',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: (context, index) {
            var individualData = data[index]['content']['itemContent']
                ['tweet_results']['result'];

            return FeedCard(
              apiData: individualData,
            );
          },
        ),
      ),
    );
  }
}
