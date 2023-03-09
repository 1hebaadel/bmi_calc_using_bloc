import 'package:bloc/bloc.dart';
import 'package:bmi_calc/bmi/bmi_screen.dart';
import 'package:bmi_calc/bmi/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bmi/cubit/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BMICubit()..calcResult(),
      child: MaterialApp(
        home: BMIScreen(),
      ),
    );
  }
}