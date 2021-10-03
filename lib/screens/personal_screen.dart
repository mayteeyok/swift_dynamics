import 'package:flutter/material.dart';
import 'package:swift_dynamic/widgets/add_person_dialog_widget.dart';
import 'package:swift_dynamic/widgets/person_list_widget.dart';

class PersonalScreen extends StatefulWidget {
  @override
  _PersonalScreenState createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  int selectedIndex = 0;
  final tabs = [PersonListWidget()];
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
              return AddPersonDialogWidget();
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
