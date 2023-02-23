import 'package:flutter/material.dart';
import 'InputPage.dart';
import 'result_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/result': (context) =>  ResultPage(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home: InputPage(),
    );
  }
}








