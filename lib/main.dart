import 'package:flutter/material.dart';
import 'app_routes.dart'; // Importa las rutas definidas
import 'themes/app_theme.dart'; // Importa los temas definidos
import 'package:http/http.dart';
import 'dart:convert';

import 'screens/HomeScreen.dart';
import 'screens/ListaRegistrosScreen.dart';
import 'screens/VisualizacionRegistroScreen.dart';
import 'screens/WidgetReutilizableScreen.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';


void main() {
  runApp(MyWeatherApp());
}

class MyWeatherApp extends StatefulWidget {
  @override
  _MyWeatherAppState createState() => _MyWeatherAppState();
}

class _MyWeatherAppState extends State<MyWeatherApp> {
  ThemeMode _themeMode = ThemeMode.light; // Inicialmente usa el tema claro

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeMode, // Usa el tema seleccionado

      initialRoute: '/',
      onGenerateRoute: AppRoutes.generateRoute,

      home: HomeScreen(
        toggleTheme: _toggleTheme, // Pasa la función para cambiar el tema a HomeScreen
      ),
    );
  }

  // Función para cambiar el tema entre claro y oscuro
  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }
}








