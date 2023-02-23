import 'package:flutter/material.dart';
import 'Constants.dart';

class Bottom_Button extends StatelessWidget {
  Bottom_Button(this.ontap() , this.buttonTitle);
  void Function ()? ontap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: KLargebuttonTextStyle,
          ),
        ),
        color: const Color(0xFFEB1555),
        margin: const EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: 80.0,
      ),
    );
  }
}