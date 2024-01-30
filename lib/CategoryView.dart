import 'package:emad/Home_View.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Text(
                  'pick the depratment',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 75,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomCategoryContainer(
                      text: 'General surgery',
                      widget: HomeView(text: 'General surgery'),
                    ),
                    CustomCategoryContainer(
                      text: 'Gynaecology',
                      widget: HomeView(text: 'Gynaecology'),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomCategoryContainer(
                      text: 'Pediatrics',
                      widget: HomeView(text: 'Pediatrics'),
                    ),
                    CustomCategoryContainer(
                      text: 'Neurology',
                      widget: HomeView(text: 'Neurology'),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomCategoryContainer(
                      text: 'Urology',
                      widget: HomeView(text: 'Urology'),
                    ),
                    CustomCategoryContainer(
                      text: 'Psychiatry',
                      widget: HomeView(text: 'Psychiatry'),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomCategoryContainer extends StatelessWidget {
  const CustomCategoryContainer({
    super.key,
    required this.text,
    required this.widget,
  });

  final String text;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) {
            return widget;
          }),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45,
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(18)),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
