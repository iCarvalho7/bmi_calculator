import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class ErrorDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kCardBackgroundColor,
      title: Text("Missing Informations"),
      content: Text("Please Insert Your Gender"),
      actions: <Widget>[
        FlatButton(
          color: kBottomContainerColor,
          child: Text("OK"),
          onPressed: (){
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}