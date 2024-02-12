import 'package:flutter/material.dart';

class WidgetReutilizableScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Reutilizable'),
      ),
      body: Center(
        child: Text('Widget reutilizable'),
      ),
    );
  }
}
