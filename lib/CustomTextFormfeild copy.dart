import 'package:flutter/material.dart';

class CustompasswordFormFeild extends StatelessWidget {
  const CustompasswordFormFeild({
    super.key,
    required this.label,
    required this.icon,
    this.suffix = false,
    required this.hint,
    required this.onchange,
    required this.isobscure,
    required this.suffixicon,
    required this.onPressed,
    required this.validator,
    required this.onFieldSubmitted,
  });
  final String label;
  final Icon icon;
  final bool suffix;
  final Icon suffixicon;
  final String hint;
  final bool isobscure;
  final void Function(String) onchange;
  final void Function() onPressed;
  final String? Function(String?)? validator;
  final Function(String) onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        obscureText: isobscure,
        onChanged: onchange,
        onFieldSubmitted: onFieldSubmitted,
        validator: validator,
        maxLines: 1,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          labelStyle: const TextStyle(fontSize: 18, color: Colors.blue),
          labelText: label,
          prefixIcon: icon,
          suffixIcon: suffix
              ? IconButton(
                  icon: suffixicon,
                  onPressed: onPressed,
                )
              : null,
          suffixIconColor: Colors.blue,
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
