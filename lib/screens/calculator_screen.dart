import 'package:flutter/material.dart';
import 'package:swift_dynamic/widgets/calc_button_widget.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:intl/intl.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _history = '';
  String _expression = '';

  void buttonClick(String text) {
    setState(() {
      _expression += text;
    });
  }

  void clearAllValue(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void calculation(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    var formatter = NumberFormat('#,###.00');

    setState(() {
      _history = _expression;
      _expression = formatter.format(eval);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                child: Text(
                  _history,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                padding: EdgeInsets.all(12),
                alignment: Alignment(1, 1),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                  ),
                ),
              ),
              Container(
                child: Text(
                  _expression,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                padding: EdgeInsets.all(12),
                alignment: Alignment(1, 1),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButtonWidget(
                    text: 'AC',
                    fillColor: 0xFF616161,
                    callback: clearAllValue,
                  ),
                  CalcButtonWidget(
                    text: 'C',
                    fillColor: 0xFF616161,
                    callback: clear,
                  ),
                  CalcButtonWidget(
                    text: '%',
                    fillColor: 0xFFEF5350,
                    callback: buttonClick,
                  ),
                  CalcButtonWidget(
                    text: '/',
                    fillColor: 0xFFEF5350,
                    callback: buttonClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButtonWidget(
                    text: '7',
                    fillColor: 0xFF00ACC1,
                    callback: buttonClick,
                  ),
                  CalcButtonWidget(
                    text: '8',
                    fillColor: 0xFF00ACC1,
                    callback: buttonClick,
                  ),
                  CalcButtonWidget(
                    text: '9',
                    fillColor: 0xFF00ACC1,
                    callback: buttonClick,
                  ),
                  CalcButtonWidget(
                    text: '*',
                    fillColor: 0xFFEF5350,
                    callback: buttonClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButtonWidget(
                    text: '4',
                    fillColor: 0xFF00ACC1,
                    callback: buttonClick,
                  ),
                  CalcButtonWidget(
                    text: '5',
                    fillColor: 0xFF00ACC1,
                    callback: buttonClick,
                  ),
                  CalcButtonWidget(
                    text: '6',
                    fillColor: 0xFF00ACC1,
                    callback: buttonClick,
                  ),
                  CalcButtonWidget(
                    text: '-',
                    fillColor: 0xFFEF5350,
                    callback: buttonClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButtonWidget(
                    text: '1',
                    fillColor: 0xFF00ACC1,
                    callback: buttonClick,
                  ),
                  CalcButtonWidget(
                    text: '2',
                    fillColor: 0xFF00ACC1,
                    callback: buttonClick,
                  ),
                  CalcButtonWidget(
                    text: '3',
                    fillColor: 0xFF00ACC1,
                    callback: buttonClick,
                  ),
                  CalcButtonWidget(
                    text: '+',
                    fillColor: 0xFFEF5350,
                    callback: buttonClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButtonWidget(
                    text: '.',
                    fillColor: 0xFF00ACC1,
                    callback: buttonClick,
                  ),
                  CalcButtonWidget(
                    text: '0',
                    fillColor: 0xFF00ACC1,
                    callback: buttonClick,
                  ),
                  CalcButtonWidget(
                    text: '00',
                    fillColor: 0xFF00ACC1,
                    callback: buttonClick,
                  ),
                  CalcButtonWidget(
                    text: '=',
                    fillColor: 0xFF558B2F,
                    callback: calculation,
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
