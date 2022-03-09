import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../data/message_model.dart';

class MessagesProvider extends ChangeNotifier {
  var headers = {"Content-Type": "application/json;charset=UTF-8"};

  Future<List<Message>> getmessages() async {
    //
    var url = await http.get(Uri.parse("http://localhost:8080/api/messages"));
    if (url.statusCode == 200) {
      var responseDecode = jsonDecode(url.body);

      List<Message> m = [];

      for (var e in responseDecode) {
        m.add(Message.fromJson(e));
      }
      return m;
    } else {
      print("error occured");
    }
    return [];
    notifyListeners();
  }

  Future addMessage(String message) async {
    var response = await http.post(
      Uri.parse("http://localhost:8080/api/add"),
      headers: headers,
      body: jsonEncode(
        <String, String>{"message": message},
      ),
    );
    if (response.statusCode == 200) {
    } else {
      throw Exception('Failed to create quote.');
    }
    notifyListeners();
  }

  Future deleteMessage(int id) async {
    var response = await http
        .delete(Uri.parse("http://localhost:8080/api/message/$id"),
            headers: headers)
        .catchError((e) {
      print("error" + e);
    });
    if (response.statusCode == 200) {
    } else {
      print("error occured");
    }
    notifyListeners();
  }
}
