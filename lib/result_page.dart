import 'package:flutter/material.dart';
import 'package:bmi_calculator/Constants.dart';
import 'package:bmi_calculator/ReuseableCard.dart';
import 'Bottum_Button.dart';


class ResultPage extends StatelessWidget {
  ResultPage({this.interpretation, this.bmiResult, this.resultText});

  String ? bmiResult;
  String ?resultText;
  String ?interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF12163A),
    appBar: AppBar(
    backgroundColor: const Color(0xFF12163A),
    title: Text('BMI CALCULATOR',),
    ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Your Result',
              style: KTitleTextStyle,
            ) ,
          ),
          ),
          Expanded(
              flex: 5,
              child: Reuseablecard(
                colour: KActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText!.toUpperCase(),
                      style: KResultTextStyle,
                    ),
                    Text(
                      bmiResult!,
                      style: KBmiTextStyle,
                    ),
                    Text(
                      interpretation!,
                      style: KBodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
          ),
          Bottom_Button(
                () {
              Navigator.pop(context);
            },
            'ReCalculate',
          ),
        ],
      ),
    );
  }
}
