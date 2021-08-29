import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'Task.dart';

class Service {
  static const String url = 'https://oderotaskapi.herokuapp.com/api/v1/tasks/';

  static Future<List<Task>> getTasks() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (200 == response.statusCode) {
        final List<Task> tasks = taskFromJson(response.body);
        return tasks;
      } else {
        return List<Task>.empty(growable: true);
      }
    } catch (e) {
      return List<Task>.empty(growable: true);
    }
  }

  static deleteTask(id) async {
     http.Response  response = await  http.delete(Uri.parse(url + id.toString() + "/delete"));
     print(response.body);
  }

  static createTask(String taskTitle, String taskDetail) async {
    Map data = {
      "title" : taskTitle,
      "detail" : taskDetail
    };
    String body = json.encode(data);
    http.Response response = await http.post(
      Uri.parse("https://oderotaskapi.herokuapp.com/api/v1/tasks/create/"),
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    print(response.body);
  }

  static updateTask(int id,String taskTitle, String taskDetail, bool complete) async {
    Map data = {
      "title" : taskTitle,
      "detail" : taskDetail,
      "complete" : complete
    };
    String body = json.encode(data);
    http.Response response = await http.put(
      Uri.parse("https://oderotaskapi.herokuapp.com/api/v1/tasks/"+ id.toString() + "/update"),
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    print(response.body);
  }
}
