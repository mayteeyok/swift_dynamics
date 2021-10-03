import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:swift_dynamic/model/person.dart';
import 'package:swift_dynamic/provider/persons.dart';
import 'package:swift_dynamic/screens/person_detail_screen.dart';

class PersonWidget extends StatelessWidget {
  final Person person;
  final int personNum;

  const PersonWidget({required this.person, required this.personNum}) : super();

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
          padding: EdgeInsets.all(5),
          child: ListTile(
            leading: Wrap(
              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  child: const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.red,
                  ),
                ),
              ],
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'คุณ${person.firstname} ${person.lastname}',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => PersonDetailScreen(
                            personNum,
                            person.firstname,
                            person.lastname,
                          )));
            },
            onLongPress: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('ลบรายการ Person'),
                    content: Text('คุณต้องการลบรายการ Person ใช่หรือไม่?'),
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
                          deletePerson(context, person);
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      );

  void deletePerson(BuildContext context, Person person) {
    final provider = Provider.of<PersonsProvider>(context, listen: false);
    provider.removePerson(person);
  }
}
