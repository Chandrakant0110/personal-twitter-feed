import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'widgets/feed_card.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  List data = [];
  int value = 1;

  void getTweets() async {
    // Headers for the API call
    var headers = {
      'X-RapidAPI-Host': 'twitter241.p.rapidapi.com',
      'X-RapidAPI-Key': '8170f21ddfmshd73754ab39afe25p1329edjsn7b090cfca454'
    };

    var response = await http.get(
      Uri.parse(
          'https://twitter241.p.rapidapi.com/user-tweets?user=1514555668946366468&count=20'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      List temp_data = jsonDecode(response.body)['result']['timeline']
          ['instructions'][2]['entries'];
      print(temp_data);
      setState(() {
        data = temp_data;
        value = 2;
      });

      print('Response data: ${data}');
    } else {
      data = [];
      print('Request failed with status: ${response.statusCode}.');
    }
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
            onPressed: getTweets,
            icon: const Icon(Icons.refresh_sharp),
          ),
        ],
      ),
      body: value == 1
          ? Text('data')
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    for (int i = 0; i < 18; i++)
                      if (data[i]['content']['clientEventInfo']['component'] ==
                          'tweet')
                        FeedCard(apiData: data, index: i),
                    // Text('data $value'),
                  ],
                ),
              ),
            ),
    );
  }
}
