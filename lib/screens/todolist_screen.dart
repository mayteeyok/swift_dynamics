import 'package:flutter/material.dart';
import 'package:swift_dynamic/widgets/add_todo_dialog_widget.dart';
import 'package:swift_dynamic/widgets/todo_list_widget.dart';

class TodolistScreen extends StatefulWidget {
  @override
  _TodolistScreenState createState() => _TodolistScreenState();
}

class _TodolistScreenState extends State<TodolistScreen> {
  int selectedIndex = 0;
  final tabs = [TodoListWidget()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[0],
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.pink,
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AddTodoDialogWidget();
            },
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
