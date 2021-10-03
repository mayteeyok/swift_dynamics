import 'package:flutter/cupertino.dart';

class PersonField {
  static const createdTime = 'createdTime';
}

class Person {
  DateTime createdTime;
  String firstname;
  String lastname;
  bool isDone;

  Person({
    required this.createdTime,
    required this.firstname,
    required this.lastname,
    this.isDone = false,
  });
}
