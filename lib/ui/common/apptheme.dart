import 'package:flutter/material.dart';

class AppTheme {
  static const primaryGreen = Color(0xFF0E7C66);
  static const gold = Color(0xFFD4AF37);

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryGreen,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Inter',
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontFamily: 'Playfair',
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryGreen,
    scaffoldBackgroundColor: const Color(0xFF0B1F1A),
    fontFamily: 'Inter',
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontFamily: 'Playfair',
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: gold,
      ),
    ),
  );
}
