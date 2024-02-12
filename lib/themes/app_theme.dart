import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.dark().copyWith(
      primary: Colors.orange, // Cambia el color primario para el tema oscuro
      secondary: Colors.deepOrangeAccent, // Cambia el color de acento para el tema oscuro
    )
  );
}
