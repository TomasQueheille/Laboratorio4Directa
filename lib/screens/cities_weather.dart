class CitiesWeather {
  final String city;
  final double temperature;
  final String description;
  final String weather;
  final String image;

  CitiesWeather(
      {required this.city,
      required this.temperature,
      required this.description,
      required this.weather,
      required this.image});
}

var citiesweather_item = <CitiesWeather>[
  CitiesWeather(
      city: "New York",
      temperature: 26.0,
      description: "Clear Sky",
      weather: "Sunny",
      image:
          "https://cdn.tiqets.com/wordpress/blog/wp-content/uploads/2017/08/03134557/24-hours-in-new-york-1.jpg"),
  CitiesWeather(
      city: "Londres",
      temperature: 26.0,
      description: "Cloud",
      weather: "Sunny",
      image:
          "https://assets.vogue.in/photos/5ce43d58f55c27a7f4a28dce/1:1/w_1080,h_1080,c_limit/London-City-Travel-Guide-Vogue-India.jpg"),
];