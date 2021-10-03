import 'package:flutter/material.dart';
import 'package:swift_dynamic/model/person.dart';
import 'package:swift_dynamic/provider/persons.dart';
import 'package:swift_dynamic/widgets/person_form_widget.dart';
import 'package:provider/provider.dart';

class AddPersonDialogWidget extends StatefulWidget {
  @override
  _AddPersonDialogWidgetState createState() => _AddPersonDialogWidgetState();
}

class _AddPersonDialogWidgetState extends State<AddPersonDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String firstname = '';
  String lastname = '';

  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'เพิ่มข้อมูล Person',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            PersonFormWidget(
              onChangedFirstname: (firstname) =>
                  setState(() => this.firstname = firstname),
              onChangedLastname: (lastname) =>
                  setState(() => this.lastname = lastname),
              onSavedPerson: () {
                addPerson();
              },
            ),
          ],
        ),
      );

  void addPerson() {
    final todo = Person(
      firstname: firstname,
      lastname: lastname,
      createdTime: DateTime.now(),
    );

    final provider = Provider.of<PersonsProvider>(context, listen: false);
    provider.addPerson(todo);

    Navigator.of(context).pop();
  }
}
