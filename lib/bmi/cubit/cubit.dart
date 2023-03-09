import 'dart:math';
import 'package:bmi_calc/bmi/cubit/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BMICubit extends Cubit<BMIStatus>{
  BMICubit() : super(InitiateBMIState());

  static BMICubit get(BuildContext context) => BlocProvider.of(context);

  double height = 170;
  bool isMale = false;
  int age = 22 ;
  int weight = 66;
  int ? result;

  void changeGender(bool value){
    isMale = value;
    emit(ChangeGenderState());
  }
  void changeHeight(double value){
    height = value;
    emit(ChangeHeightState());
  }
  void increaseWeight(){
    weight++;
    emit(IncreaseWeightState());
  }
  void decreaseWeight(){
    weight--;
    emit(DecreaseWeightState());
  }
  void increaseAge(){
    age++;
    emit(IncreaseAgeState());
  }
  void decreaseAge(){
    age--;
    emit(DecreaseAgeState());
  }
  void calcResult(){
    result = (weight / pow(height/100 , 2)).round();
    emit(CalcResultState());
  }
}