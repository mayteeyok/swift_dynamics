import 'package:flutter/material.dart';

class PersonFormWidget extends StatelessWidget {
  final String firstname;
  final String lastname;
  final ValueChanged<String> onChangedFirstname;
  final ValueChanged<String> onChangedLastname;
  final VoidCallback onSavedPerson;

  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();

  PersonFormWidget({
    this.firstname = '',
    this.lastname = '',
    required this.onChangedFirstname,
    required this.onChangedLastname,
    required this.onSavedPerson,
  }) : super();

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildFirstname(),
            const SizedBox(height: 8),
            buildLastname(),
            const SizedBox(height: 8),
            buildButton(context),
          ],
        ),
      );

  Widget buildFirstname() => TextFormField(
        maxLines: 1,
        initialValue: firstname,
        onChanged: onChangedFirstname,
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'ชื่อ',
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'กรอกชื่อด้วยครับ';
          }
          return null;
        },
      );

  Widget buildLastname() => TextFormField(
        maxLines: 1,
        initialValue: lastname,
        onChanged: onChangedLastname,
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'นามสกุล',
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'กรอกนามสกุลด้วยครับ';
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
              onPressed: onSavedPerson,
              child: const Text('บันทึก'),
            ),
          ),
        ],
      );
}
