import 'package:emad/CustomContainer.dart';
import 'package:emad/Logic/cubit/appcubit.dart';
import 'package:emad/Logic/cubit/appstates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<AppCubit, AppStates>(
        builder: (context, state) {
          return Form(
            key: BlocProvider.of<AppCubit>(context).SearchFK,
            autovalidateMode:
                BlocProvider.of<AppCubit>(context).autovalidateMode,
            child: Scaffold(
              appBar: AppBar(
                title: const Text(
                  'search',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Colors.blue,
                centerTitle: true,
                elevation: 0,
              ),
              backgroundColor: Colors.white,
              body: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 25),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          BlocProvider.of<AppCubit>(context).changed();
                        },
                        onFieldSubmitted: (p) {
                          if (BlocProvider.of<AppCubit>(context)
                              .SearchFK
                              .currentState!
                              .validate()) {
                            BlocProvider.of<AppCubit>(context)
                                .seraching(p, text);
                            if (BlocProvider.of<AppCubit>(context)
                                .user
                                .isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'No data for this code in this department'),
                                ),
                              );
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
                        decoration: const InputDecoration(
                          labelStyle:
                              TextStyle(fontSize: 18, color: Colors.blue),
                          labelText: 'Find your patient ',
                          prefixIcon: Icon(Icons.search),
                          suffixIconColor: Colors.blue,
                          prefixIconColor: Colors.blue,
                          hintText: 'Enter User Code',
                          hintStyle:
                              TextStyle(fontSize: 16, color: Colors.blue),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            var user2 =
                                BlocProvider.of<AppCubit>(context).user[index];
                            return CustomContainer(
                              name: user2['Name'],
                              age: user2['age'],
                              date: user2['date'],
                              code: user2['Code'],
                              temp: user2['Temp'],
                              oxgen: user2['oxgen'],
                              pR: user2['PlusRate'],
                              pin: user2['pin'],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 10,
                            );
                          },
                          itemCount:
                              BlocProvider.of<AppCubit>(context).user.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
