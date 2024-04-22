// import 'dart:convert';
// import 'dart:ffi';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class FeedScreen extends StatefulWidget {
//   const FeedScreen({super.key});

//   @override
//   State<FeedScreen> createState() => _FeedScreenState();
// }

// class _FeedScreenState extends State<FeedScreen> {
//   String name = 'Loading...';
//   dynamic accountDetails = {};
//   Map<String, dynamic> tweetDetails = {};
//   Future<void> getTweets() async {
//     Map<String, dynamic> cont;
//     var headers = {
//       'X-RapidAPI-Host': 'twitter241.p.rapidapi.com',
//       'X-RapidAPI-Key': '8170f21ddfmshd73754ab39afe25p1329edjsn7b090cfca454'
//     };

//     var response = await http.get(
//       Uri.parse(
//           'https://twitter241.p.rapidapi.com/user-tweets?user=1514555668946366468&count=4'),
//       headers: headers,
//     );

//     if (response.statusCode == 200) {
//       cont = jsonDecode(response.body);

//       var abc = cont['result']['timeline']['instructions'][2]['entries'][2]
//           ['content']['itemContent']['tweet_results']['result'];

//       var accDetails = abc['core']['user_results']['result']['legacy'];
//       var tweetData = abc['legacy'];
//       String username = accDetails['screen_name'];
//       setState(() {
//         name = username;
//         accountDetails = accDetails;
//         tweetDetails = tweetData;
//       });
//       print('Response data: ${accDetails}');
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//     }
//   }

//   // @override
//   // void setState(VoidCallback fn) {
//   //   // TODO: implement setState
//   //   super.setState(fn);
//   // }

//   @override
//   void initState() {
//     // TODO: implement initState
//     getTweets();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           ElevatedButton(
//             onPressed: getTweets,
//             child: Text(
//               'Click to fetch content',
//             ),
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           Text('${accountDetails['name']}'),
//           Text('${accountDetails['followers_count']}'),
//           Text('${accountDetails['friends_count']}'),
//           Text('${accountDetails['screen_name']}'),
//           CircleAvatar(
//             radius: 40,
//             foregroundImage: NetworkImage(
//               '${accountDetails['profile_image_url_https']}',
//             ),
//           ),
//           Text('${tweetDetails['full_text']}'),
//           Text('${tweetDetails['favorite_count']}'),
//         ],
//       ),
//     );
//   }
// }
