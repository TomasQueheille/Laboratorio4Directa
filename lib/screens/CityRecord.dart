import 'package:flutter/material.dart';
import 'package:laboratorio4proyecto2/screens/cities_weather.dart';

class Registros {
  final String city;
  final double temperature;
  final String weatherDescription;

  Registros({
    required this.city,
    required this.temperature,
    required this.weatherDescription,
  });

  factory Registros.fromCitiesWeather(CitiesWeather cityWeather) {
    return Registros(
      city: cityWeather.city,
      temperature: cityWeather.temperature,
      weatherDescription: cityWeather.description,
    );}

  static List<Registros> getRegistros(String city) {
    if (city == 'New York') {
      return getNewYorkRegistros();
    } else if (city == 'London') {
      return getLondresRegistros();
    } else {
      throw Exception('Unknown city');
    }
  }

  static Icon getIcon(String clima){
    if (clima == 'Clear Sky') return Icon(Icons.sunny, color: Colors.yellow);
    
    if (clima == 'Partly Cloudy') return Icon(Icons.cloud, color: const Color.fromARGB(255, 161, 161, 153));
    
    if (clima == 'Cloudy') return Icon(Icons.cloud, color: const Color.fromARGB(255, 161, 161, 153));
    
    if (clima == 'Rainy') return Icon(Icons.shower, color: Color.fromARGB(255, 9, 199, 212));
    
    if (clima == 'Thunderstorms') return Icon(Icons.thunderstorm, color: Color.fromARGB(255, 223, 132, 14));
    
    if (clima == 'Snow') return Icon(Icons.cloudy_snowing, color: Color.fromARGB(255, 252, 252, 252));
    
    if (clima == 'Sleet') return Icon(Icons.cloudy_snowing, color: Color.fromARGB(255, 91, 193, 201));
    
    if (clima == 'Freezing Rain') return Icon(Icons.shower, color: Color.fromARGB(255, 9, 199, 212));

    if (clima == 'Ice') return Icon(Icons.ac_unit, color: const Color.fromARGB(255, 255, 255, 255));
    
    return Icon(Icons.abc);
  }

  static List<Registros> getNewYorkRegistros() {
    return [
      Registros(
        city: 'New York',
        temperature: 26.11,
        weatherDescription: 'Clear Sky',
      ),
      Registros(
        city: 'New York',
        temperature: 27.22,
        weatherDescription: 'Partly Cloudy',
      ),
      Registros(
        city: 'New York',
        temperature: 28.33,
        weatherDescription: 'Cloudy',
      ),
      Registros(
        city: 'New York',
        temperature: 29.44,
        weatherDescription: 'Rainy',
      ),
      Registros(
        city: 'New York',
        temperature: 30.55,
        weatherDescription: 'Thunderstorms',
      ),
      Registros(
        city: 'New York',
        temperature: 31.66,
        weatherDescription: 'Snow',
      ),
      Registros(
        city: 'New York',
        temperature: 32.77,
        weatherDescription: 'Sleet',
      ),
      Registros(
        city: 'New York',
        temperature: 33.88,
        weatherDescription: 'Freezing Rain',
      ),
      Registros(
        city: 'New York',
        temperature: 34.99,
        weatherDescription: 'Ice',
      ),
    ];
  }

  static List<Registros> getLondresRegistros() {
    return [
      Registros(
        city: 'London',
        temperature: 16.11,
        weatherDescription: 'Clear Sky',
      ),
      Registros(
        city: 'London',
        temperature: 17.22,
        weatherDescription: 'Partly Cloudy',
      ),
      Registros(
        city: 'London',
        temperature: 18.33,
        weatherDescription: 'Cloudy',
      ),
      Registros(
        city: 'London',
        temperature: 19.44,
        weatherDescription: 'Rainy',
      ),
      Registros(
        city: 'London',
        temperature: 20.55,
        weatherDescription: 'Thunderstorms',
      ),
      Registros(
        city: 'London',
        temperature: 21.66,
        weatherDescription: 'Snow',
      ),
      Registros(
        city: 'London',
        temperature: 22.77,
        weatherDescription: 'Sleet',
      ),
      Registros(
        city: 'London',
        temperature: 23.88,
        weatherDescription: 'Freezing Rain',
      ),
      Registros(
        city: 'London',
        temperature: 24.99,
        weatherDescription: 'Ice',
      ),
    ];
  }
}


