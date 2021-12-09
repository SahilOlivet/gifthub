
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gifts_hub/consts/font_style.dart';

class ReusableCard extends StatelessWidget {
  IconData icon;
  String cardText;
  Color color;
  ReusableCard ( {required this.cardText,required this.icon,required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        child: ListTile(
          leading: Icon(
            icon,
            color: color,
          ),
          title: Text(
              cardText,
              style: FontStyles.myTextStyle2
          ),
        ));
  }
}
