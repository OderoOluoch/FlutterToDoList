import 'package:flutter/material.dart';
import 'package:to_do/tasks/TaskService.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({Key? key}) : super(key: key);
  @override
  _CreateTaskPageState createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create new Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Add a title to your task",
                  labelText: "Task Title",
                  labelStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.teal
                  ),
                  border:OutlineInputBorder()
              ),
              autofocus: true,
              controller: titleController,
              maxLines: 2,
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Include a brief description",
                  labelText: "Task Description",
                  labelStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.teal
                  ),
                  border:OutlineInputBorder()
              ),
              autofocus: true,
              controller: descriptionController,
              maxLines: 6,
            ),
            ElevatedButton(onPressed: (){
              Service.createTask(titleController.text, descriptionController.text);
              Navigator.pop(context);
            },child: Text("Create Task")),
          ],
        ),
      )
    );
  }
}
