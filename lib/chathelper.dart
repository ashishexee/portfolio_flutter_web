import 'dart:convert';

import 'package:http/http.dart' as http;

var client = http.Client();

Future<String> getResponse(String message) async {
  Map<String, String> responseHeader = {'Content-Type': 'application/json'};

  var url = Uri.parse("http://192.168.29.229:3000/api/chat");
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
