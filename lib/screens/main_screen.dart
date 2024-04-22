import 'package:flutter/material.dart';
import 'package:social_media_app/api/api_call.dart';
import 'package:social_media_app/widgets/feed_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> data = [];
  @override
  void initState() {
    // Get tweet data from the server when the screen is opened
    // getData();
    super.initState();
  }

  Future<void> getData() async {
    data = await API.getTweets();
    // setState(() {});
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
        actions: [
          IconButton(
            onPressed: () async {
              var fetchData = await API.getTweets();
              setState(() {
                data = fetchData;
              });
            },
            icon: const Icon(Icons.refresh_sharp),
          ),
        ],
      ),
      body: data == null || data == []
          ? const Text('Please refresh')
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return FeedCard(
                    apiData: data,
                    index: index,
                  );
                },
              ),
            ),
    );
  }
}
