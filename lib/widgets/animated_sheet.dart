import 'package:flutter/material.dart';
import '../core/style.dart';

Future<T?> showPremiumSheet<T>(BuildContext context, Widget child) {
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (ctx) => GestureDetector(
      onTap: () => Navigator.of(ctx).pop(),
      child: AnimatedPadding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
          padding: const EdgeInsets.all(16),
          decoration: premiumCardDecoration(radius: 20),
          child: child,
        ),
      ),
    ),
  );
}
