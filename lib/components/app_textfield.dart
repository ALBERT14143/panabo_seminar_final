import 'package:flutter/material.dart';

class AppTextfield extends StatelessWidget {
  final String hintText;
  final Icon prefixIcon;
  final TextEditingController controller;
  final bool? obscureText;
  const AppTextfield({
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.obscureText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: TextField(
        controller: controller,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          hintText: hintText,
        ),
      ),
    );
  }
}