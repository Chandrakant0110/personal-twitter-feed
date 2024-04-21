import 'dart:convert';
import 'package:http/http.dart' as http;

class API {
  static dynamic getTweets() async {
    dynamic data;
    String name = 'Loading...';
    dynamic accountDetails = {};
    Map<String, dynamic> tweetDetails = {};

    Map<String, dynamic> cont;

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
      cont = jsonDecode(response.body);
      data = jsonDecode(response.body)['result']['timeline']['instructions'][2]
          ['entries'];

      var abc = cont['result']['timeline']['instructions'][2]['entries'][0]
          ['content']['itemContent']['tweet_results']['result'];

      var accDetails = abc['core']['user_results']['result']['legacy'];
      var tweetData = abc['legacy'];
      String username = accDetails['screen_name'];
      print('Response data: ${accDetails}');

      name = username;
      accountDetails = accDetails;
      tweetDetails = tweetData;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
