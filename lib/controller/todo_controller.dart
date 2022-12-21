import 'package:api_semi_final/model/todo_model.dart';
import 'package:api_semi_final/repository/repo.dart';

class TodoController {
  final Repository _repository;
  TodoController(this._repository);

  Future<List<Todo>> fetchTodoList() async {
    return _repository.getTodoList();
  }

}