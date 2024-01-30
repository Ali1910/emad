import 'package:emad/Logic/cubit/appcubit.dart';
import 'package:emad/checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.name,
    required this.age,
    required this.code,
    required this.temp,
    required this.oxgen,
    required this.pR,
    required this.pin,
    required this.date,
  });
  final String name;
  final int age;
  final int code;
  final int temp;
  final double oxgen;
  final int pR;
  final String pin;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return PinChecker(
                  pin: pin,
                  name: name,
                  age: age,
                  temp: temp,
                  oxgen: oxgen,
                  pR: pR,
                  date: date,
                  code: code,
                );
              },
            ),
          );
          BlocProvider.of<AppCubit>(context).user;
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    'assets/images/1.jpg',
                    fit: BoxFit.contain,
                    width: 50,
                    height: 50,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name: $name',
                        style:
                            const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Text(
                        'Enter date: $date',
                        style:
                            const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
