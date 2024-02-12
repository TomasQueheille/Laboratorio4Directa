import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:laboratorio4proyecto2/screens/thirtyrecord.dart';
import 'package:http/http.dart' as http;
import 'package:laboratorio4proyecto2/screens/VisualizacionRegistroScreen.dart';

class ListaRegistrosScreen extends StatefulWidget {
  final String? cityName;

  const ListaRegistrosScreen({Key? key, this.cityName}) : super(key: key);

  @override
  _ListaRegistrosScreenState createState() => _ListaRegistrosScreenState();
}

class _ListaRegistrosScreenState extends State<ListaRegistrosScreen> {
  String _selectedLanguage = 'en'; // Idioma seleccionado por defecto
  Map<String, String> _languageCodes = {
    'English': 'en',
    'Français': 'fr',
    'Italiano': 'it',
    'Español': 'es',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Records of ${widget.cityName}'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildLanguageDropdown(),
          ),
          Expanded(
            child: FutureBuilder<List<ThirtyRecord>>(
              future: _fetchThirtyRecords(widget.cityName, _selectedLanguage),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No hay registros disponibles.'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final record = snapshot.data![index];
                      return GestureDetector(
                        onTap: () {
                          _navigateToDetailsScreen(record);
                        },
                        child: Card(
                          elevation: 4,
                          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Temperature: ${record.main['temp']} Cº',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Description: ${record.weather[0]['description']}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[700],
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Date: ${record.dt_txt}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageDropdown() {
  return DropdownButtonFormField<String>(
    value: _selectedLanguage,
    onChanged: (String? newValue) {
      if (newValue != null) {
        setState(() {
          _selectedLanguage = newValue;
          // Llamar a _fetchThirtyRecords para obtener registros con el nuevo idioma
          _fetchThirtyRecords(widget.cityName, _selectedLanguage);
        });
      }
    },
    items: _languageCodes.keys.map<DropdownMenuItem<String>>((String key) {
      return DropdownMenuItem<String>(
        value: _languageCodes[key],
        child: Text(key),
      );
    }).toList(),
    decoration: InputDecoration(
      labelText: 'Select Language',
      border: OutlineInputBorder(),
    ),
  );
}


  Future<List<ThirtyRecord>> _fetchThirtyRecords(
      String? cityName, String language) async {
    if (cityName == null || cityName.isEmpty) {
      return [];
    }

    String languageCode = _languageCodes[language] ?? 'en'; // Default to English if language code not found
    String apiUrl =
        'https://api-rest-weather.onrender.com/api/v1/getList50Length/next30weather?city=$cityName&lang=$languageCode';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        List<ThirtyRecord> records = data
            .map((recordJson) => ThirtyRecord.fromJson(recordJson))
            .toList();
        return records;
      } else {
        throw Exception('Failed to load weather records');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }

  void _navigateToDetailsScreen(ThirtyRecord record) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VisualizacionRegistroScreen(registro: record),
      ),
    );
  }
}