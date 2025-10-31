import 'package:flutter/material.dart';

const gold = Color(0xFFFFD700);

BoxDecoration premiumCardDecoration({double radius = 14}) {
  return BoxDecoration(
    color: Colors.grey.shade900.withOpacity(0.9),
    borderRadius: BorderRadius.circular(radius),
    border: Border.all(color: gold.withOpacity(0.9), width: .7),
    boxShadow: [
      BoxShadow(
        color: gold.withOpacity(0.06),
        blurRadius: 24,
        spreadRadius: 2,
        offset: const Offset(0, 8),
      ),
      BoxShadow(
        color: Colors.black.withOpacity(0.6),
        blurRadius: 6,
        offset: const Offset(0, 4),
      ),
    ],
  );
}
