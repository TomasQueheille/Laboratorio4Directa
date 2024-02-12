import 'package:flutter/material.dart';
import 'package:laboratorio4proyecto2/screens/CityRecord.dart';
import 'package:laboratorio4proyecto2/screens/thirtyrecord.dart';
import 'screens/HomeScreen.dart';
import 'screens/ListaRegistrosScreen.dart';
import 'screens/VisualizacionRegistroScreen.dart';
import 'screens/WidgetReutilizableScreen.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen(toggleTheme: () {  },));
      case '/lista_registros':
        return MaterialPageRoute(builder: (context) {
          final String? cityName = settings.arguments as String?;
          return ListaRegistrosScreen(cityName: cityName);
        });
      case '/visualizacion_registro':
        return MaterialPageRoute(builder: (context) {
          final ThirtyRecord registro = settings.arguments as ThirtyRecord;
          return VisualizacionRegistroScreen(registro: registro);
        });
      case '/widget_reutilizable':
        return MaterialPageRoute(builder: (_) => WidgetReutilizableScreen());
      default:
        // Manejar rutas desconocidas aquí, por ejemplo, redirigir a una página de error
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(
              title: Text('Error'),
            ),
            body: Center(
              child: Text(
                '404 - Page not found',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        );
    }
  }
}

