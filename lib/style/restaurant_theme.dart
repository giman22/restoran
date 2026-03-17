import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RestaurantTheme {
  static TextTheme get _lightTextTheme {
    return GoogleFonts.poppinsTextTheme().copyWith(
      bodyLarge: const TextStyle(color: Colors.black),
      bodyMedium: const TextStyle(color: Colors.black87),
    );
  }

  static TextTheme get _darkTextTheme {
    return GoogleFonts.poppinsTextTheme().copyWith(
      bodyLarge: const TextStyle(color: Colors.white),
      bodyMedium: const TextStyle(color: Colors.white70),
      titleLarge: const TextStyle(color: Colors.white),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      colorSchemeSeed: Colors.orange,
      brightness: Brightness.light,
      textTheme: _lightTextTheme,
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorSchemeSeed: Colors.orange,
      brightness: Brightness.dark,
      textTheme: _darkTextTheme,
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
      ),
    );
  }
}
