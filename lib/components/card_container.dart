import 'package:flutter/material.dart';
import '../constants.dart';

class CardContainer extends StatelessWidget {

  final IconData genderIcon;
  final String genderText;

  CardContainer({@required this.genderIcon, @required this.genderText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          genderIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          genderText,
          style: kCustomStyle ,
        )
      ],
    );
  }
}