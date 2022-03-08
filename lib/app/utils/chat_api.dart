import 'dart:convert';

import 'package:chat_application/app/data/message_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

var url = "http://localhost:8080/api";
const headers = {"Content-Type": "application/json;charset=UTF-8"};

/************************* fetch method  **************/
List<Message> parseUser(String responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;
  var messages = list.map((e) => Message.fromJson(e)).toList();
  return messages;
}

Future<List<Message>> fetchMessages() async {
  final http.Response response = await http.get(Uri.parse(url + "/messages"));

  if (response.statusCode == 200) {
    return compute(parseUser, response.body);
  } else {
    throw Exception(response.statusCode);
  }
}

/************************** add method  */
Future addEmployee(String message) async {
  var response = await http.post(
    Uri.parse(url + "/add"),
    headers: headers,
    body: jsonEncode(
      <String, String>{"message": message},
    ),
  );
  if (response.statusCode == 200) {
  } else {
    throw Exception('Failed to create quote.');
  }
}

/************************** delete method **********/
Future deleteMessage(int id) async {
  var response = await http
      .delete(Uri.parse(url + "/message/$id"), headers: headers)
      .catchError((e) {
    print("error" + e);
  });
  if (response.statusCode == 200) {
  } else {
    print("error occured");
  }
}
