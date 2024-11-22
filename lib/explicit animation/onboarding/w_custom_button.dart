import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });
  final Function onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0XFF2F7EF0).withOpacity(0.6),
          borderRadius: BorderRadius.circular(20),
        ),
        child: IconButton(
          onPressed: () {
            onPressed();
          },
          icon: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
