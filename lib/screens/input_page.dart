import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';
import '../components/reusable_card.dart';
import '../components/card_container.dart';
import '../constants.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/error_dialog.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color borderColor = kCardBackgroundColor;
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    borderColor: borderColor,
                    onPressed: () {
                      setState(() {
                        borderColor = kCardBackgroundColor;
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kInactiveCardBGColor
                        : kCardBackgroundColor,
                    cardChild: CardContainer(
                      genderIcon: FontAwesomeIcons.mars,
                      genderText: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    borderColor: borderColor,
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kInactiveCardBGColor
                        : kCardBackgroundColor,
                    cardChild: CardContainer(
                        genderIcon: FontAwesomeIcons.venus,
                        genderText: "FEMALE"),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            colour: kCardBackgroundColor,
            borderColor: kCardBackgroundColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("HEIGHT", style: kCustomStyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(height.toString(), style: kBigFontStyle),
                    Text(
                      "cm",
                      style: kCustomStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayColor: Color(0x29EB1555),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                      thumbColor: Color(0xFFEB1555)),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newHeight) {
                      setState(() {
                        height = newHeight.round();
                      });
                    },
                  ),
                ),
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  borderColor: kCardBackgroundColor,
                  colour: kCardBackgroundColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("WEIGHT", style: kCustomStyle),
                      Text(weight.toString(), style: kBigFontStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                  child: ReusableCard(
                    colour: kCardBackgroundColor,
                    borderColor: kCardBackgroundColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "AGE",
                          style: kCustomStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kBigFontStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonText: "CALCULATE",
            onTap: () {
              if (selectedGender == null) {
                setState(() {
                  _showDialog(context);
                  borderColor = kBottomContainerColor;
                });
              } else {
                CalculatorBrain calc = CalculatorBrain(
                    height: height,
                    weight: weight,
                    age: age,
                    gender: selectedGender);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      result: calc.calculateBMI(),
                      status: calc.getResult(),
                      description: calc.getDescription(),
                    ),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}

void _showDialog(BuildContext context) {
  showDialog(context: context, builder: (BuildContext context){
    return ErrorDialog();
  });
}