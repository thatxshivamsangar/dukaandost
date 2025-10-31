import 'package:flutter/material.dart';

class GoldButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const GoldButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFFFD700),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
