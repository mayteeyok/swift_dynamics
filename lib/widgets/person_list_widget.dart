import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swift_dynamic/provider/persons.dart';
import 'package:swift_dynamic/widgets/person_widget.dart';

class PersonListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PersonsProvider>(context);
    final persons = provider.persons;

    return persons.isEmpty
        ? const Center(
            child: Text(
              'ไม่พบข้อมูล Person.',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(16),
            separatorBuilder: (context, index) => Container(height: 8),
            itemCount: persons.length,
            itemBuilder: (context, index) {
              final person = persons[index];
              return PersonWidget(person: person, personNum: index);
            },
          );
  }
}
