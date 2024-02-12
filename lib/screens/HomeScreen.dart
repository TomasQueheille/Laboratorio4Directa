import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:laboratorio4proyecto2/screens/ListaRegistrosScreen.dart';
import 'package:laboratorio4proyecto2/screens/CityRecord.dart';

class HomeScreen extends StatefulWidget {
  final Function() toggleTheme;

  const HomeScreen({Key? key, required this.toggleTheme}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Registros>> futureCitiesWeather;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    futureCitiesWeather = Future.value([]); // Inicializamos sin datos
  }

  Future<List<Registros>> _fetchCitiesWeather(String ciudad) async {
    if (ciudad.isEmpty) {
      return [];
    }

    String apiUrl =
        'https://api-rest-weather.onrender.com/api/v1/getById/city?city=$ciudad';

    try {
      final response = await http.get(Uri.parse(apiUrl)).timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<Registros> citiesWeatherList = [];

        data.forEach((cityName, cityData) {
          citiesWeatherList.add(Registros(
              city: cityData["city"],
              temperature: cityData["temperature"],
              weatherDescription: cityData["weatherDescription"]));
        });

        return citiesWeatherList;
      } else {
        throw Exception('Error al cargar los datos: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.palette),
            onPressed: () {
              widget.toggleTheme();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Buscar Ciudad',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Ingrese el nombre de la ciudad',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    _fetchWeatherForCity(_searchController.text);
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: FutureBuilder<List<Registros>>(
                future: futureCitiesWeather,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.data == null || snapshot.data!.isEmpty) {
                    return Center(
                      child: Text("No hay registros disponibles."),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return _buildCityCard(context, snapshot.data![index]);
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCityCard(BuildContext context, Registros cityWeather) {
    final String cityName = cityWeather.city;

    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(cityName ?? 'No se seleccionó ninguna ciudad'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Temperature: ${cityWeather.temperature} Cº'),
            Text('Description: ${cityWeather.weatherDescription}'),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ListaRegistrosScreen(cityName: cityName),
            ),
          );
        },
      ),
    );
  }

  void _fetchWeatherForCity(String ciudad) {
    setState(() {
      futureCitiesWeather = _fetchCitiesWeather(ciudad);
    });
  }
}






