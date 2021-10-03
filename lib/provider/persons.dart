import 'package:flutter/cupertino.dart';
import 'package:swift_dynamic/model/person.dart';

class PersonsProvider extends ChangeNotifier {
  final List<Person> _persons = [];

  List<Person> get persons =>
      _persons.where((person) => person.isDone == false).toList();

  List<Person> get todosCompleted =>
      _persons.where((person) => person.isDone == true).toList();

  void addPerson(Person person) {
    _persons.add(person);

    notifyListeners();
  }

  void removePerson(Person person) {
    _persons.remove(person);

    notifyListeners();
  }
}
