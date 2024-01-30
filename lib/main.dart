import 'package:emad/CategoryView.dart';
import 'package:emad/Home_View.dart';
import 'package:emad/Logic/cubit/appcubit.dart';
import 'package:emad/LoginView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginInView(),
      ),
    );
  }
}
