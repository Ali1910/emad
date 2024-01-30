import 'package:flutter/material.dart';

class DataViewPage extends StatelessWidget {
  const DataViewPage(
      {super.key,
      required this.name,
      required this.age,
      required this.temp,
      required this.oxgen,
      required this.pR,
      required this.date,
      required this.code});
  final String name;
  final int age;
  final int temp;
  final double oxgen;
  final int pR;
  final int code;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('view'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomViewRow(
                value1: name,
                value2: age.toString(),
                feild1: 'name',
                feild2: 'age',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomViewRow(
                value1: temp.toString(),
                value2: date.toString(),
                feild1: 'Temp',
                feild2: 'enterdate',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomViewRow(
                value1: oxgen.toString(),
                value2: pR.toString(),
                feild1: 'oxgenR',
                feild2: 'pulseRate',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomViewRow extends StatelessWidget {
  const CustomViewRow({
    super.key,
    required this.value1,
    required this.value2,
    required this.feild1,
    required this.feild2,
  });

  final String value1;
  final String value2;
  final String feild1;
  final String feild2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomViewContainer(
          text: feild1,
          name: value1,
        ),
        CustomViewContainer(
          text: feild2,
          name: value2,
        ),
      ],
    );
  }
}

class CustomViewContainer extends StatelessWidget {
  const CustomViewContainer({
    super.key,
    required this.name,
    required this.text,
  });

  final String name;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.43,
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
          color: Colors.blue.shade100, borderRadius: BorderRadius.circular(18)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            '$text:',
            style: const TextStyle(fontSize: 24, color: Colors.blue),
          ),
          Text(
            name,
            style: const TextStyle(
                fontSize: 24, color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
