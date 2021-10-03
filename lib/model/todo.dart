import 'package:flutter/cupertino.dart';

class TodoField {
  static const createdTime = 'createdTime';
}

class Todo {
  DateTime createdTime;
  String title;
  bool isDone;

  Todo({
    required this.createdTime,
    required this.title,
    this.isDone = false,
  });
}
