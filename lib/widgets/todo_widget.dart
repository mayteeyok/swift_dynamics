import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:swift_dynamic/model/todo.dart';
import 'package:swift_dynamic/provider/todos.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;
  final int todoNum;

  const TodoWidget({required this.todo, required this.todoNum}) : super();

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Slidable(
          actionPane: const SlidableDrawerActionPane(),
          child: buildTodo(context),
        ),
      );

  Widget buildTodo(BuildContext context) => Card(
        child: Padding(
          padding: EdgeInsets.all(0),
          child: ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${todoNum + 1}. ${todo.title}',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            onLongPress: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('ลบรายการ Todo'),
                    content: Text('คุณต้องการลบรายการ Todo ใช่หรือไม่?'),
                    actions: [
                      ElevatedButton(
                        child: const Text('ไม่'),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      ElevatedButton(
                        child: const Text('ใช่'),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          deleteTodo(context, todo);
                        },
                      ),
                    ],
                  );
                },
              );
            },
            onTap: () {
              print('onTap Todo');
            },
          ),
        ),
      );

  void deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);
  }
}
