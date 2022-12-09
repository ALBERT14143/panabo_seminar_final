import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final Color? color;
  const AppButton({
    required this.title,
    required this.onPressed,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 14),
          backgroundColor: color ?? Color.fromARGB(255, 31, 63, 121),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
        ),
        onPressed: onPressed, 
        child: Text(title)
      ),
    );
  }
}