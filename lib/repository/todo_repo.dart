import 'package:api_semi_final/model/todo_model.dart';
import 'package:api_semi_final/repository/repo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class TodoRepo implements Repository{
  String dataUrl = 'https://jsonplaceholder.typicode.com';
  @override
  Future<List<Todo>> getTodoList() async {
    List<Todo> todoList = [];
    var url = Uri.parse('$dataUrl/todos');
    var response = await http.get(url);
    print('Status Code:  ${response.statusCode}');
    var body = json.decode(response.body);
    for (var i = 0; i < body.length; i++){
      todoList.add(Todo.fromJson(body[i]));
    }
    return todoList;
  }
}