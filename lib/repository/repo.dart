import 'package:api_semi_final/model/todo_model.dart';

abstract class Repository {
  Future<List<Todo>> getTodoList();
}