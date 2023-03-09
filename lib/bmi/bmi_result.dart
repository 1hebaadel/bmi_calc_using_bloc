import 'package:bmi_calc/bmi/cubit/cubit.dart';
import 'package:bmi_calc/bmi/cubit/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BMIResultScreen extends StatelessWidget {

  // final bool isMale;
  // final int age;
  // final int weight;
  // final int height;
  // final int result;

  // BMIResultScreen({
  //   required this.isMale,
  //   required this.age,
  //   required this.weight,
  //   required this.height,
  //   required this.result
  // });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BMICubit , BMIStatus>(
      listener: (context, state) {},
      builder: (context, state) {

        BMICubit cubit = BMICubit.get(context);

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'BMI Result',
            ),
          ),
          body: Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Gender: ${cubit.isMale ? 'Male' : 'Female'}',
              ),
              Text(
                'Age: ${cubit.age}',
              ),
              Text(
                'Weight: ${cubit.weight}',
              ),
              Text(
                'Height: ${cubit.height.round()}',
              ),
              Text(
                'Result: ${cubit.result}',
              ),
            ],
          )),
        );
      },
    );
  }
}
