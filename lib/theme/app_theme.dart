
import 'package:flutter/material.dart';

class AppTheme {
  static const Color background = Color(0xFF070910);
  static const Color surface = Color(0xFF0B1020);
  static const Color primary = Color(0xFF5278FF);
  static const Color accent = Color(0xFFD5AD65);
  static const Color textPrimary = Color(0xFFE5E3ED);
  static const Color textSecondary = Color(0xFFA7ADBE);

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: background,
    primaryColor: primary,
    fontFamily: 'Roboto',
    useMaterial3: true,

    colorScheme: const ColorScheme.dark(
      primary: primary,
      secondary: accent,
      surface: surface,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: background,
      elevation: 0,
      centerTitle: true,
    ),
  );
}
