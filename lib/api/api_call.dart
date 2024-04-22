import 'dart:convert';
import 'package:http/http.dart' as http;

class API {
  static Future<List> getTweets() async {
    List<dynamic> data = [];

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
      data = jsonDecode(response.body)['result']['timeline']['instructions'][2]
          ['entries'];

      print('Response data: ${data}');
      return data;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return [];
    }
  }
}
