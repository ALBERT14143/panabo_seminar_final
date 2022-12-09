import 'package:flutter/material.dart';

class ProfileDetailsItem extends StatelessWidget {
  final String title;
  final IconData icon;
  const ProfileDetailsItem({
    required this.title,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
        ),
        color: Colors.indigo.withOpacity(0.3),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 32),
          child: Row(
            children: [
              Icon(icon, color: Colors.indigo, size: 32,),
              SizedBox(width: 15),
              Text(
                title, style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18, 
                  color: Color.fromARGB(255, 78, 72, 72)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}