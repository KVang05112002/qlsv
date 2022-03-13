import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
final ipAddress = "192.168.1.11:8080";
Future<dynamic> getData(String apiURL, {int secs = 3}) async {
  String url = 'http://$ipAddress/$apiURL';
  // debugPrint(url);

  final response = await http.get(Uri.parse(url), headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  }).timeout(Duration(seconds: secs));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return response.body;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception(
        'Lỗi lấy dữ liệu (getData). statusCode: ${response.statusCode} ${response.body}');
  }
}