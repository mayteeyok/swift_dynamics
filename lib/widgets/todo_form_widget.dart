import 'package:flutter/material.dart';

class TodoFormWidget extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final VoidCallback onSavedTodo;

  final titleController = TextEditingController();

  TodoFormWidget({
    this.title = '',
    this.description = '',
    required this.onChangedTitle,
    required this.onSavedTodo,
  }) : super();

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildTitle(),
            const SizedBox(height: 8),
            buildButton(context),
          ],
        ),
      );

  Widget buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: title,
        onChanged: onChangedTitle,
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'หัวข้อ',
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'กรอกหัวข้อด้วยครับ';
          }
          return null;
        },
      );

  Widget buildButton(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('ปิดหน้าต่าง'),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              onPressed: onSavedTodo,
              child: const Text('บันทึก'),
            ),
          ),
        ],
      );
}
