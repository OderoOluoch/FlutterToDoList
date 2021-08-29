import 'package:flutter/material.dart';
import 'package:to_do/tasks/CreateTask.dart';
import 'package:to_do/tasks/UpdateTask.dart';
import 'ShimmerWidget.dart';
import 'TaskService.dart';
import 'Task.dart';

class TaskList extends StatefulWidget {
  TaskList() : super();

  @override
  TaskListState createState() => TaskListState();
}

class TaskListState extends State<TaskList> {
  List<Task> _tasks = List<Task>.empty(growable: true);
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _fetchTasks();
  }

  void _fetchTasks() {
    loading = true;
    buildTaskShimmer();
    Service.getTasks().then((tasks) {
      setState(() {
        _tasks = tasks;
        loading = false;
      });
    });
  }

  void _deleteTask(int id) {
    Service.deleteTask(id);
    _fetchTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(loading ? 'Loading task list..' : 'Task List'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: _fetchTasks, icon: Icon(Icons.refresh))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _fetchTasks();
        },
        color: Colors.grey,
        child: ListView.builder(
          //padding: EdgeInsets.only(top: 10),
          itemCount: loading ? 9 : _tasks.length,
          itemBuilder: (context, index) {
            if (loading) {
              return buildTaskShimmer();
            } else {
              Task task = _tasks[index];
              return Card(
                child: ListTile(
                  tileColor: task.complete ? Colors.grey : null,
                  title: Text(task.title),
                  subtitle: Text(task.detail),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UpdateTaskPage(
                          id: task.id,
                          title: task.title,
                          detail: task.detail,
                          complete: task.complete))),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteTask(task.id),
                  ),
                ),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CreateTaskPage())),
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buildTaskShimmer() => ListTile(
        title: ShimmerWidget.rectangular(height: 15),
        subtitle: ShimmerWidget.rectangular(height: 35),
      );
}
