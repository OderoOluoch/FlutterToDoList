// To parse this JSON data, do
//
//     final task = taskFromJson(jsonString);

import 'dart:convert';

List<Task> taskFromJson(String str) => List<Task>.from(json.decode(str).map((x) => Task.fromJson(x)));

String taskToJson(List<Task> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Task {
  int id;
  String title;
  String detail;
  bool complete;
  DateTime created;
  DateTime updated;

  Task({
    required this.id,
    required this.title,
    required this.detail,
    required this.complete,
    required this.created,
    required this.updated,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    id: json["id"],
    title: json["title"],
    detail: json["detail"],
    complete: json["complete"],
    created: DateTime.parse(json["created"]),
    updated: DateTime.parse(json["updated"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "detail": detail,
    "complete": complete,
    "created": created.toIso8601String(),
    "updated": updated.toIso8601String(),
  };
}
