import 'package:bmi_calc/bmi/cubit/cubit.dart';
import 'package:bmi_calc/bmi/cubit/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bmi_result.dart';

class BMIScreen extends StatelessWidget {
  const BMIScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BMICubit , BMIStatus>(
      listener: (context, state) {},
      builder: (context, state) {

        BMICubit cubit = BMICubit.get(context);

        return Scaffold(
          backgroundColor: Colors.grey[900],
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              'BMI Calculator',
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            cubit.changeGender(true);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: cubit.isMale ? Colors.redAccent : Colors.grey[800],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.male ,
                                  color: Colors.white,
                                  size: 100,
                                ),
                                Text(
                                  'Male',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            cubit.changeGender(false);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: !cubit.isMale ? Colors.redAccent : Colors.grey[800],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.female ,
                                  color: Colors.white,
                                  size: 100,
                                ),
                                Text(
                                  'Female',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Height',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 28,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(
                              '${cubit.height!.round()}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 38,
                                  fontWeight: FontWeight.w900
                              ),
                            ),
                            Text(
                              'CM',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300
                              ),
                            ),
                          ],
                        ),
                        Slider(
                          value: cubit.height,
                          max: 220.0,
                          min: 80.0,
                          onChanged: (value){
                            cubit.changeHeight(value);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Weight',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                '${cubit.weight}',
                                style: TextStyle(
                                  fontSize: 34,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    FloatingActionButton(
                                      heroTag: 'weight++',
                                      onPressed: (){
                                        cubit.increaseWeight();
                                      },
                                      child: Icon(
                                        Icons.add,
                                      ),
                                    ),
                                    FloatingActionButton(
                                      heroTag: 'weight--',
                                      onPressed: (){
                                        cubit.decreaseWeight();
                                      },
                                      child: Icon(
                                        Icons.remove,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Age',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                '${cubit.age}',
                                style: TextStyle(
                                  fontSize: 34,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    FloatingActionButton(
                                      heroTag: ' age++',
                                      onPressed: (){
                                        cubit.increaseAge();
                                      },
                                      child: Icon(
                                        Icons.add,
                                      ),
                                    ),
                                    FloatingActionButton(
                                      heroTag: ' age--',
                                      onPressed: (){
                                        cubit.decreaseAge();
                                      },
                                      child: Icon(
                                        Icons.remove,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: MaterialButton(
                  height: 60,
                  color: Colors.redAccent,
                  onPressed: (){
                    cubit.calcResult();
                    Navigator.push(
                      context , MaterialPageRoute(builder: (context) =>
                        BMIResultScreen(
                          // height: cubit.height.round(),
                          // age: cubit.age,
                          // isMale: cubit.isMale,
                          // weight: cubit.weight,
                          // result: cubit.result!,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Calculate',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
