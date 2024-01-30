import 'package:flutter/material.dart';

class CustomEmailFormFeild extends StatelessWidget {
  const CustomEmailFormFeild({
    super.key,
    required this.label,
    required this.icon,
    required this.hint,
    required this.onchange,
    required this.onPressed,
    required this.validator,
    required this.onFieldSubmitted,
  });
  final String label;
  final Icon icon;

  final String hint;

  final void Function(String) onchange;
  final void Function() onPressed;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        onChanged: onchange,
        onFieldSubmitted: onFieldSubmitted,
        validator: validator,
        maxLines: 1,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          labelStyle: const TextStyle(fontSize: 18, color: Colors.blue),
          labelText: label,
          prefixIcon: icon,
          prefixIconColor: Colors.blue,
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 16, color: Colors.blue),
          border: const OutlineInputBorder(
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
      ),
    );
  }
}
