import 'package:emad/CategoryView.dart';
import 'package:emad/CustomTextFormfeild%20copy.dart';
import 'package:emad/CustomTextFormfeild.dart';
import 'package:emad/Logic/Loginlogic.dart';
import 'package:emad/Logic/cubit/appcubit.dart';
import 'package:emad/Logic/cubit/appstates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginInView extends StatelessWidget {
  const LoginInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        return Form(
          key: BlocProvider.of<AppCubit>(context).LoginFK,
          autovalidateMode: BlocProvider.of<AppCubit>(context).autovalidateMode,
          child: SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: BlocBuilder<AppCubit, AppStates>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.25,
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadiusDirectional.only(
                                bottomStart: Radius.circular(180),
                                bottomEnd: Radius.circular(180),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'login',
                                style: TextStyle(
                                  fontSize: 32,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                          CustomEmailFormFeild(
                            label: "Email",
                            icon: const Icon(Icons.email),
                            hint: 'Enter Email',
                            onchange: (Email) {
                              BlocProvider.of<AppCubit>(context).email = Email;
                            },
                            onFieldSubmitted: (p0) {
                              BlocProvider.of<AppCubit>(context).email = p0;
                            },
                            onPressed: () {},
                            validator: (String) {
                              if (String?.isEmpty ?? true) {
                                return 'feild is required';
                              }
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustompasswordFormFeild(
                            label: "Password",
                            icon: const Icon(Icons.lock),
                            suffix: true,
                            hint: 'Enter Password',
                            onchange: (Password) {
                              BlocProvider.of<AppCubit>(context).password =
                                  Password;
                            },
                            onFieldSubmitted: (p0) {
                              BlocProvider.of<AppCubit>(context).password = p0;
                            },
                            isobscure:
                                BlocProvider.of<AppCubit>(context).isobscure,
                            suffixicon:
                                BlocProvider.of<AppCubit>(context).isobscure
                                    ? const Icon(Icons.remove_red_eye)
                                    : const Icon(Icons.remove_red_eye_outlined),
                            onPressed: () {
                              BlocProvider.of<AppCubit>(context).showpassword();
                            },
                            validator: (String) {
                              if (String?.isEmpty ?? true) {
                                return 'feild is required';
                              }
                            },
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (BlocProvider.of<AppCubit>(context)
                                  .LoginFK
                                  .currentState!
                                  .validate()) {
                                print(BlocProvider.of<AppCubit>(context).email);
                                print(BlocProvider.of<AppCubit>(context)
                                    .password);
                                if (login(
                                    password: BlocProvider.of<AppCubit>(context)
                                        .password,
                                    email: BlocProvider.of<AppCubit>(context)
                                        .email)) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) {
                                        return const CategoryView();
                                      }),
                                    ),
                                  );
                                } else {
                                  BlocProvider.of<AppCubit>(context)
                                          .autovalidateMode =
                                      AutovalidateMode.always;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          "wrong email or password Try again"),
                                    ),
                                  );
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                fixedSize: const Size(200, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                )),
                            child: const Text(
                              'Login',
                              style: TextStyle(fontSize: 18),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
