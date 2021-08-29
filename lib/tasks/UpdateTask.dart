import 'package:flutter/material.dart';
import 'package:to_do/tasks/TaskService.dart';

class UpdateTaskPage extends StatefulWidget {
  final int id;
  final String title;
  final String detail;
  late bool complete;

   UpdateTaskPage(
      {Key? key,
      required this.id,
      required this.title,
      required this.detail,
      required this.complete})
      : super(key: key);

  @override
  _UpdateTaskPageState createState() => _UpdateTaskPageState();
}

class _UpdateTaskPageState extends State<UpdateTaskPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    titleController.text = widget.title;
    descriptionController.text = widget.detail;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Update Task"),
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
                    hintText: "Update the title to your task",
                    labelText: "Task Title",
                    labelStyle: TextStyle(fontSize: 20, color: Colors.teal),
                    border: OutlineInputBorder()),
                autofocus: true,
                controller: titleController,
                maxLines: 2,
              ),
              SizedBox(
                height: 16,
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: "Update the task description",
                    labelText: "Task Description",
                    labelStyle: TextStyle(fontSize: 20, color: Colors.teal),
                    border: OutlineInputBorder()),
                autofocus: true,
                controller: descriptionController,
                maxLines: 6,
              ),
              SizedBox(
                height: 16,
              ),
              CheckboxListTile(
                title: Text('Task Complete'),
                value: widget.complete,
                onChanged: (bool? value) {
                  setState(() {
                    widget.complete = value!;
                  });
                },
              ),
              SizedBox(
                height: 14,
              ),
              ElevatedButton(
                  onPressed: () {
                    Service.updateTask(widget.id, titleController.text,
                        descriptionController.text,widget.complete);
                    Navigator.pop(context);
                  },
                  child: Text("Update Task")),
            ],
          ),
        ));
  }
}
