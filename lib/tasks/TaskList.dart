import 'package:flutter/material.dart';
//import 'package:to_do/tasks/TaskService.dart';
import 'TaskService.dart';
import 'Task.dart';

class TaskList extends StatefulWidget{
  TaskList() : super();

  @override
  TaskListState createState() => TaskListState();
}

class TaskListState extends State<TaskList>{
   List<Task> _tasks = List<Task>.empty(growable: true);
   bool loading = true;

  @override
  void initState() {
    super.initState();
    loading = true;
    Service.getTasks().then((tasks){
      setState(() {
        _tasks = tasks;
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title: Text(loading ? 'Loading task list..' : 'Task List'),
      ),
      body:Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: null == _tasks ? 0 : _tasks.length,
            itemBuilder: (context,index){
            Task task = _tasks[index];
            return ListTile(
              title: Text(task.title),
              subtitle: Text(task.detail),
            );
            },
        ),
      ),
    );
  }
}