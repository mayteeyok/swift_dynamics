import 'package:flutter/material.dart';

class CalcButtonWidget extends StatelessWidget {
  final String text;
  final int fillColor;
  final int textColor;
  final double textSize;
  final Function callback;

  CalcButtonWidget({
    required this.text,
    required this.fillColor,
    this.textColor = 0xFFFFFFFF,
    this.textSize = 24,
    required this.callback,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
        width: 65,
        height: 65,
        child: ElevatedButton(
          child: Text(
            text,
            style: TextStyle(
              color: Color(textColor),
              fontSize: textSize,
            ),
          ),
          style: ButtonStyle(
            backgroundColor: fillColor != null
                ? MaterialStateProperty.all(
                    Color(fillColor),
                  )
                : null,
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          onPressed: () {
            callback(text);
          },
        ),
      ),
    );
  }
}
