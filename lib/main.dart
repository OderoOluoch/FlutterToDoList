import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:to_do/note.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'To Do Notes'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Client client = http.Client();

  List<Note> notes = [];

  @override
  void initState() {
    _fetchNotes();
    super.initState();
  }

  _fetchNotes() async {
    // const String getUrl =  "http://10.0.2.2:8000/";
    // notes = [];
    // List response = json.decode({await client.get(new Uri.http("locahost:8000",""))}.body);
    var response = await http.get(Uri.http("10.0.2.2:8000", "/api/v1/tasks/"));
    var jsonData = jsonDecode(response.body);
    List<Note> notes = [];
    for (var n in jsonData){
      Note note = Note(n["id"], n["body"]);
      notes.add(note);
    }
    setState(() {
    });
  }

  void _addToDoNote(){
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:ListView.builder(
        itemCount: notes.length,
          itemBuilder: (BuildContext context, int index){
          return ListTile(
            title:Text("Title Here"),
          );
          },
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addToDoNote,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
