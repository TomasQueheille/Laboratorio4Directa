import 'package:flutter/material.dart';
import 'package:laboratorio4proyecto2/screens/thirtyrecord.dart';

class VisualizacionRegistroScreen extends StatelessWidget {
  final ThirtyRecord registro;

  const VisualizacionRegistroScreen({Key? key, required this.registro}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Visualización de Registro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow('Date', registro.dt_txt, textStyle),
            SizedBox(height: 16),
            _buildInfoRow('Temperature', '${registro.main['temp']}Cº ', textStyle),
            SizedBox(height: 16),
            _buildInfoRow('Weather Description', registro.weather[0]['description'], textStyle),
            SizedBox(height: 16),
            _buildInfoRow('Visibility', registro.visibility.toString(), textStyle),
            SizedBox(height: 16),
            _buildInfoRow('Clouds', registro.clouds.toString(), textStyle),
            SizedBox(height: 16),
            _buildInfoRow('Wind', registro.wind.toString(), textStyle),
            SizedBox(height: 16),
            _buildInfoRow('Pop', registro.pop.toString(), textStyle),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value, TextTheme textStyle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        Divider(), // Añade una línea divisora entre cada atributo para mejorar la legibilidad
      ],
    );
  }
}



