class WeatherData {
  final double temperature;
  final int pressure;
  final String main;
  final double windSpeed;
  final DateTime sunrise;
  final DateTime sunset;
  final String description;

  final int humidity;
  final int visibility;
  final String name;
  final String icon;


  WeatherData({
    required this.pressure,
    required this.description,
    required this.sunrise,
    required this.sunset,
    required this.icon,
    required this.name,
    required this.temperature,
    required this.main,
    required this.windSpeed,
    required this.humidity,
    required this.visibility,
  });

  factory WeatherData.fromJson(Map<String, dynamic> data){
    //final wind = json['wind'];
    final weather = data['weather'][0];
    final sys = data['sys'];
    double temperature = data["main"]["temp"];
    String main = data["weather"][0]["main"];
    double windSpeed = data["wind"]["speed"];
    int humidity = data["main"]["humidity"];
    int visibility = data["visibility"];
    String name = data["name"];
    String icon = data["weather"][0]["icon"];
    return WeatherData(
      pressure: data["main"]["pressure"],

      description: weather['description'],
      sunrise: DateTime.fromMillisecondsSinceEpoch(sys['sunrise'] * 1000, isUtc: true).toLocal(),
      sunset: DateTime.fromMillisecondsSinceEpoch(sys['sunset'] * 1000, isUtc: true).toLocal(),
      icon : icon,
      name: name,
      temperature: temperature,
      main: main,
      windSpeed: windSpeed,
      humidity: humidity,
      visibility: visibility,
    );
  }
}


