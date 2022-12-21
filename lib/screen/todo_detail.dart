import 'package:flutter/material.dart';

class TodoDetail extends StatefulWidget {

  final dynamic todo;

  const TodoDetail({required this.todo, Key? key}) : super(key: key);

  @override
  State<TodoDetail> createState() => _TodoDetailState();
}

class _TodoDetailState extends State<TodoDetail> {

  Widget rowItem(String title, dynamic value) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(title),
        ),
        const SizedBox(width: 5),
        Text(value.toString())
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo Details"),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      width: 600,
                      child: rowItem("ID", widget.todo["id"]
                      )
                  ),
                ),
              ],
            ),
          ),

          Card(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      width: 600,
                      child: rowItem("User ID: ", widget.todo["userId"]
                      )
                  ),
                ),
              ],
            ),
          ),

          Card(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      width: 600,
                      child: rowItem("Title: ", widget.todo["title"]
                      )
                  ),
                ),
              ],
            ),
          ),

          Card(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      width: 600,
                      child: rowItem("Completed: ", widget.todo["completed"]
                      )
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
