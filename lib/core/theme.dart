import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF000000);
  static const Color accent = Color(0xFFFFD700);
  static const Color background = Color(0xFFF8F8F8);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: background,
    appBarTheme: const AppBarTheme(
      backgroundColor: primary,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: accent,
      foregroundColor: Colors.black,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: primary,
      secondary: accent,
    ),
  );
}
