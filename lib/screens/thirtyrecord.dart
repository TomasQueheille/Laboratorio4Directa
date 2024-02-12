class ThirtyRecord {
  final int dt;
  final Map<String, dynamic> main;
  final List<Map<String, dynamic>> weather;
  final Map<String, dynamic> clouds;
  final Map<String, dynamic> wind;
  final int visibility;
  final dynamic pop;
  final Map<String, dynamic> sys;
  final String dt_txt;

  ThirtyRecord({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.sys,
    required this.dt_txt,
  });

  factory ThirtyRecord.fromJson(Map<String, dynamic> json) {
    return ThirtyRecord(
      dt: json['dt'],
      main: json['main'],
      weather: List<Map<String, dynamic>>.from(json['weather']),
      clouds: json['clouds'],
      wind: json['wind'],
      visibility: json['visibility'],
      pop: json['pop'],
      sys: json['sys'],
      dt_txt: json['dt_txt'],
    );
  }
}