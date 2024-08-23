import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get themeData {
    return ThemeData(
      primaryColor: Colors.black,
      hintColor: Colors.grey[800],
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black, // Ensure app bar text is black
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(color: Colors.grey[100], fontSize: 32, fontWeight: FontWeight.bold),
        displayMedium: TextStyle(color: Colors.grey[200], fontSize: 28, fontWeight: FontWeight.bold),
        displaySmall: TextStyle(color: Colors.grey[300], fontSize: 24, fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(color: Colors.grey[400], fontSize: 20, fontWeight: FontWeight.bold),
        headlineSmall: TextStyle(color: Colors.grey[500], fontSize: 18, fontWeight: FontWeight.bold),
        titleLarge: TextStyle(color: Colors.grey[600], fontSize: 16, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(color: Colors.grey[700], fontSize: 14),
        bodyMedium: TextStyle(color: Colors.grey[800], fontSize: 12),
        bodySmall: TextStyle(color: Colors.grey[900], fontSize: 10),
      ),
      iconTheme: IconThemeData(color: Colors.grey[300]),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.grey[700],
        textTheme: ButtonTextTheme.primary,
      ),
      dividerColor: Colors.grey[600],
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey).copyWith(
        surface: Colors.white,
      ),
    );
  }
}
