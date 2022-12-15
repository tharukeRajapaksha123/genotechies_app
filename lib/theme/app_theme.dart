import 'package:flutter/material.dart';
import 'package:genotechies_app/theme/constants.dart';

class CustomAppTheme {
  ThemeData get appTheme => ThemeData(
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        fontFamily: "Roboto",
        indicatorColor: primaryColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor,
          centerTitle: false,
        ),
        textTheme: const TextTheme(
          bodySmall: TextStyle(
            fontSize: smallFontSize,
          ),
          bodyLarge: TextStyle(
            fontSize: largeFontSize,
          ),
          bodyMedium: TextStyle(
            fontSize: mediumFontSize,
          ),
          headlineLarge: TextStyle(
            fontSize: largerFontSize,
          ),
        ),
      );
}
