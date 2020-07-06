import 'dart:math';

import 'package:bmi_calculator/screens/input_page.dart';
import 'package:flutter/cupertino.dart';

class CalculatorBrain{

  CalculatorBrain({@required this.weight, @required this.height, @required this.gender, @required this.age});

  Gender gender;
  int age;
  int height;
  int weight;

  double _bmi;

  String calculateBMI(){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    String res;
    switch(gender){
      case Gender.male : res = getMaleResult(); break;
      case Gender.female : res = getFemaleResult(); break;
    }
    return res;
  }

  String getMaleResult(){
    if(_bmi <= 20.7){
      return "Underweight";
    }else if(_bmi > 20.7 && _bmi < 27.8){
      return "Normal";
    }else if(_bmi > 27.8){
      return "Overweight";
    }else{
      return "Leo";
    }
  }

  String getFemaleResult(){
    if(_bmi <= 19.1){
      return "Underweight";
    }else if(_bmi > 19.1 && _bmi < 32.3){
      return "Normal";
    }else if(_bmi > 32.3){
      return "Overweight";
    }else{
      return "Leo";
    }
  }

  String getDescription(){
    if(_bmi <= 20){
      return "You have a lower than normal body weight. You can eat a bit more.";
    }else if(_bmi > 20 && _bmi < 32){
      return "You have a normal body weight. Good job!";
    }else{
      return "You have a higher than normal body weight. Try to exercise more.";
    }
  }
}