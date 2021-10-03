import 'package:flutter/material.dart';
import 'package:swift_dynamic/provider/todos.dart';
import 'package:swift_dynamic/provider/persons.dart';
import 'package:swift_dynamic/screens/calculator_screen.dart';
import 'package:swift_dynamic/screens/personal_screen.dart';
import 'package:swift_dynamic/screens/todolist_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider<TodosProvider>(
              create: (context) => TodosProvider()),
          ChangeNotifierProvider<PersonsProvider>(
              create: (context) => PersonsProvider()),
        ],
        child: MaterialApp(
          title: 'Swift Dynamics',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(
            title: 'Swift Dynamics Examination',
          ),
        ),
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

int selectedIndex = 0;

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  List<Widget> list = [
    TodolistScreen(),
    CalculatorScreen(),
    PersonalScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: list[index],
      drawer: MyDrawer(
        onTap: (context, i) {
          setState(() {
            index = i;
            selectedIndex = i;
            Navigator.pop(context);
          });
        },
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  final Function onTap;

  MyDrawer({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            child: Material(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  DrawerHeader(
                    decoration: const BoxDecoration(color: Colors.blue),
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            width: 60,
                            height: 60,
                            child: const CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.red,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'Maytee Jittworawongse',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'maytee@gmail.com',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.transparent,
                    child: ListTile(
                      leading: const Icon(
                        Icons.work,
                        color: Colors.black,
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                      title: const Text(
                        'To Do List',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      onTap: () => onTap(context, 0),
                    ),
                  ),
                  Container(
                    color: Colors.transparent,
                    child: ListTile(
                      leading: const Icon(
                        Icons.calculate,
                        color: Colors.black,
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                      title: const Text(
                        'Calculator',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      onTap: () => onTap(context, 1),
                    ),
                  ),
                  Container(
                    color: Colors.transparent,
                    child: ListTile(
                      leading: const Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                      title: const Text(
                        'Personal Data',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      onTap: () => onTap(context, 2),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
