import 'package:emad/DataViewPage.dart';
import 'package:emad/Logic/cubit/appcubit.dart';
import 'package:emad/Logic/cubit/appstates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PinChecker extends StatelessWidget {
  PinChecker({
    super.key,
    required this.pin,
    required this.name,
    required this.age,
    required this.temp,
    required this.oxgen,
    required this.pR,
    required this.date,
    required this.code,
  });
  final String pin;
  final String name;
  final int age;
  final String date;
  final int temp;
  final double oxgen;
  final int pR;
  final int code;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<AppCubit>(context).PInCheckerFK,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: BlocBuilder<AppCubit, AppStates>(
              builder: (context, state) {
                return TextFormField(
                  keyboardType: TextInputType.number,
                  obscureText: BlocProvider.of<AppCubit>(context).isobscure,
                  onFieldSubmitted: (p) {
                    if (BlocProvider.of<AppCubit>(context)
                        .PInCheckerFK
                        .currentState!
                        .validate()) {
                      if (p == pin) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return DataViewPage(
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
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("wrong Pin Try again")));
                      }
                    }
                  },
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'field is required';
                    } else
                      return null;
                  },
                  maxLines: 1,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    labelStyle:
                        const TextStyle(fontSize: 18, color: Colors.blue),
                    labelText: 'Pin',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.remove_red_eye),
                      onPressed: () {
                        BlocProvider.of<AppCubit>(context).showpassword();
                      },
                    ),
                    suffixIconColor: Colors.blue,
                    prefixIconColor: Colors.blue,
                    hintText: 'Enter user Pin',
                    hintStyle:
                        const TextStyle(fontSize: 16, color: Colors.blue),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
