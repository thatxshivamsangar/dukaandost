import 'package:flutter/material.dart';

class DarkCard extends StatelessWidget {
  final Widget child;
  const DarkCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFFFD700), width: .6),
      ),
      child: child,
    );
  }
}
