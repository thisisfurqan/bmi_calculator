import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'ReuseableCard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'IconContent.dart';
import 'Constants.dart';
import 'Bottum_Button.dart';
import 'calculator_brain.dart';
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
class _InputPageState extends State<InputPage> {

  Gender ? SlectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;
  Color malecardColor = KInActiveCardColor;
  Color FemalecardColor = KInActiveCardColor;

  /**************** Used Ternary operator instead of this long function (updateColor)  ******************/

  //this function will update the active card color
  // Man card active = 1 , Female card active= 0

  // void updateColor(gender){
  //
  //   if (gender == GenderType.Male){   // Toggle active card color for male
  //     if (malecardColor == inActiveCardColor){
  //       malecardColor = ActiveCardColor;
  //       FemalecardColor = inActiveCardColor;
  //     }
  //   }
  //
  //   if (gender == GenderType.Female){  // Toggle active card color for female
  //     if (FemalecardColor == inActiveCardColor){
  //       FemalecardColor = ActiveCardColor;
  //       malecardColor = inActiveCardColor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF12163A),
        appBar: AppBar(
          backgroundColor: const Color(0xFF12163A),
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            /************ Male & Female cards **************/
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          SlectedGender = Gender.Male;
                        });
                      },
                      child: Reuseablecard(
                        colour: SlectedGender == Gender.Male ? KActiveCardColor : KInActiveCardColor,
                        cardChild:  IconContent(
                            FontAwesomeIcons.mars, 'Male'
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          SlectedGender=Gender.Female;
                        });
                      },
                      child: Reuseablecard(
                        colour: SlectedGender == Gender.Female ? KActiveCardColor : KInActiveCardColor,
                        cardChild: IconContent(
                            FontAwesomeIcons.venus, 'Female'
                        ),
                      ),
                    ),
                  ),
                ],
              ),),
            /**************** Slider part ***************/
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width*1,
                child: Reuseablecard(
                  colour: const Color(0xFF1D1E33) ,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: KLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: KNumberTextStyle,
                          ),
                          Text(
                            'cm',
                            style: TextStyle(
                            color: Color(0xFF8D8E98),
                            ),
                          ),
                        ],
                      ),
                      Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 220,
                          activeColor: Color(0xFFEB1555),
                          inactiveColor: Color(0xFF8D8E98),
                          onChanged: (double newValue){
                            setState(() {
                              height = newValue.round();
                            });
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            /******* Age and Height Cards **************/
            Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Reuseablecard(
                        colour:const Color(0xFF1D1E33),
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('WEIGHT', style: KLabelTextStyle,),
                            Text(
                              weight.toString(),
                              style: KNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Increment Button
                                FloatingActionButton(
                                  backgroundColor: Color(0xFF4C4F5),
                                  child: Icon(
                                    FontAwesomeIcons.plus,
                                  ),
                                    onPressed: (){setState(() {
                                      weight++;
                                    });
                                    }, //onpressed
                                ),
                                // Decrement Button
                                SizedBox(width: 10,),
                                FloatingActionButton(
                                  backgroundColor: Color(0xFF4C4F5),
                                  child: Icon(
                                    FontAwesomeIcons.minus,
                                  ),
                                  onPressed: (){
                                    setState(() {
                                    weight--;
                                  });
                                  }, //onPressed
                                ),
                              ],
                            ),

                          ],
                    ),),),
                    Expanded(child: Reuseablecard(colour: const Color(0xFF1D1E33),cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE', style: KLabelTextStyle,),
                        Text(
                          age.toString(),
                          style: KNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Increment Button
                            FloatingActionButton(
                              backgroundColor: Color(0xFF4C4F5),
                              child: Icon(
                                FontAwesomeIcons.plus,
                              ),
                              onPressed: (){setState(() {
                                age++;
                              });
                              }, //onpressed
                            ),
                            // Decrement Button
                            SizedBox(width: 10,),
                            FloatingActionButton(
                              backgroundColor: const Color(0xFF4C4F5),
                              child: Icon(
                                FontAwesomeIcons.minus,
                              ),
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              }, //onPressed
                            ),
                          ],
                        ),
                      ],
                    ),),),
                  ],
                )),
            /************ Bottom Container [Calculate Button] ***********/
            Bottom_Button(
              () {
                calculator_brain calc = calculator_brain(height: height, weight: weight);

                Navigator.push(
                    context,MaterialPageRoute(builder: (context) => ResultPage(
                  bmiResult: calc.calculateBmi(),
                  resultText:calc.getResult() ,
                  interpretation: calc.getInterpretation(),
                ),),);
              },
              'Calculate',
            ),
          ],
        ),
    );
  }
}

