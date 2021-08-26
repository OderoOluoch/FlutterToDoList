import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart';
import 'package:to_do/tasks/TaskList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TaskList(),
    );
  }
}

