import 'package:api_semi_final/controller/todo_controller.dart';
import 'package:api_semi_final/model/todo_model.dart';
import 'package:api_semi_final/repository/todo_repo.dart';
import 'package:api_semi_final/screen/todo_detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List listTodos = [];
  int count = 0;

  @override
  void initState() {
    count = 0;
    super.initState();
    getTodo();
  }

  getTodo() async {
    var url = 'https://jsonplaceholder.typicode.com/todos';
    var response = await http.get(Uri.parse(url));
    setState(() {
      listTodos = convert.jsonDecode(response.body) as List<dynamic>;
    });
  }

  @override
  Widget build(BuildContext context) {
    var todoController = TodoController(TodoRepo());
    todoController.fetchTodoList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Bagac - API Semi Final Hands On Exam"),
        leading: const Icon(Icons.code),
      ),

      body: FutureBuilder<List<Todo>>(
        future: todoController.fetchTodoList(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError){
            return const Center(
              child: Text('Error'),
            );
          }

          return ListView.separated(
              itemBuilder: (context, index){
                var todo = snapshot.data?[index];
                return Card(
                  child: ListTile(
                    title: Text('${todo?.title}'),
                    subtitle: Text('ID Number: ${todo?.id}'),
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) =>
                              TodoDetail(todo: listTodos[index])));
                    },
                  ),
                );
              },
              separatorBuilder: (context, index){
                return const Divider(
                  thickness: 1,
                  height: 1,
                );
              },
              itemCount: snapshot.data?.length ?? 0);

        },
      ),
    );
  }
}
