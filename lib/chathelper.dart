import 'dart:convert';

import 'package:http/http.dart' as http;

var client = http.Client();

Future<String> getResponse(String message) async {
  Map<String, String> responseHeader = {'Content-Type': 'application/json'};

  var url = Uri.parse("https://portfolio-flutter-web.onrender.com/api/chat");
  var response = await client.post(
    url,
    headers: responseHeader,
    body: jsonEncode({"message": message}),
  );
  print(response.body);
  if (response.statusCode == 200) {
    var content = jsonDecode(response.body);
    String reply = content['reply'];
    return reply;
  } else {
    throw Exception('could get the reply');
  }
}
