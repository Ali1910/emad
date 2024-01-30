import 'package:emad/FakeData.dart';
import 'package:emad/Logic/cubit/appstates.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitailState());
  List user = [];
  late String email;
  late String password;
  GlobalKey<FormState> LoginFK = GlobalKey();
  GlobalKey<FormState> SearchFK = GlobalKey();
  GlobalKey<FormState> PInCheckerFK = GlobalKey();
  bool isobscure = true;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  void showpassword() {
    isobscure = !isobscure;
    emit(AnotherState());
  }

  void changed() {
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
    emit(AnotherState());
  }

  void seraching(String p, String category) {
    user = [];
    for (var element in patients['patient']) {
      if (element['Code'].toString() == p &&
          element['categ'] == category &&
          element['DR'] == email) {
        user.add(element);
      }
    }
    emit(AnotherState());
  }
}
