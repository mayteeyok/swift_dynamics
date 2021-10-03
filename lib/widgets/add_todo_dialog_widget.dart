import 'package:flutter/material.dart';
import 'package:swift_dynamic/model/todo.dart';
import 'package:swift_dynamic/provider/todos.dart';
import 'package:swift_dynamic/widgets/todo_form_widget.dart';
import 'package:provider/provider.dart';

class AddTodoDialogWidget extends StatefulWidget {
  @override
  _AddTodoDialogWidgetState createState() => _AddTodoDialogWidgetState();
}

class _AddTodoDialogWidgetState extends State<AddTodoDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = '';

  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'เพิ่มรายการ Todo',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            TodoFormWidget(
              onChangedTitle: (title) => setState(() => this.title = title),
              onSavedTodo: () {
                addTodo();
              },
            ),
          ],
        ),
      );

  void addTodo() {
    final todo = Todo(
      title: title,
      createdTime: DateTime.now(),
    );

    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.addTodo(todo);

    Navigator.of(context).pop();
  }
}
