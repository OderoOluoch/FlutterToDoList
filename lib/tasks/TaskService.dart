import 'package:http/http.dart' as http;
import 'Task.dart';

class Service{
  static const String url = 'https://oderotaskapi.herokuapp.com/api/v1/tasks/';
  static Future<List<Task>> getTasks() async{
    try{
      final response = await http.get(Uri.parse(url));
      if(200 == response.statusCode){
        final List<Task> tasks = taskFromJson(response.body);
        return tasks;
      }else{
        return List<Task>.empty(growable: true);
      }
    }catch(e){
      return List<Task>.empty(growable: true);
    }
  }
}