import 'dart:math';
class calculator_brain {
  calculator_brain({this.height=0, this.weight=0});
  int  height;
  int  weight;
  double _bmi = 0.0;

  String calculateBmi(){
    _bmi = (weight.toDouble()/pow(height.toDouble()/100, 2));
    return _bmi.toStringAsPrecision(3);
  }
  String getResult (){
    if (_bmi>=25)
      return 'Overweight';
    else if(_bmi>18.5) return 'Normal';
    else return 'Underweight';
  }
  String getInterpretation (){
    if (_bmi>=25)
      return 'Try to to exercise and loose some weight';
    else if(_bmi>18.5) return 'Good job! You\'re fit';
    else return 'Eat More and gain some weight';
  }

}