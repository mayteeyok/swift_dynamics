import 'package:flutter/material.dart';

class PersonDetailScreen extends StatefulWidget {
  final int personNum;
  final String firstname;
  final String lastname;
  PersonDetailScreen(this.personNum, this.firstname, this.lastname);

  @override
  _PersonDetailScreenState createState() =>
      _PersonDetailScreenState(personNum, firstname, lastname);
}

class _PersonDetailScreenState extends State<PersonDetailScreen> {
  _PersonDetailScreenState(personNum, firstname, lastname);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'รายละเอียดข้อมูล Person',
          textAlign: TextAlign.start,
        ),
      ),
      body: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 200,
                height: 200,
                child: const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.red,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'รหัส:',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '#${widget.personNum + 1}',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'ชื่อ:',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${widget.firstname}',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'นามสกุล:',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${widget.lastname}',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
