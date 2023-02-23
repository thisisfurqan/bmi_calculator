import 'package:flutter/material.dart';
class Reuseablecard extends StatelessWidget {

  Reuseablecard({this.colour=Colors.white, this.cardChild= const SizedBox()});

  Color ? colour;
  Widget ? cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(15),
    );
  }
}