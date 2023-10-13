import 'dart:convert';
import 'package:http/http.dart';

import '../exceptions/network_exception.dart';
import '../exceptions/not_found_exception.dart';
import '../weatherData/weather_data.dart';

class WeatherService {
  Future fetchWeatherData(city) async {
    try {
      String apiKey = "d6a2d5044f29ce3451af83c81be956ab";
      Response response = await get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey"));
      if (response.statusCode == 404) {
        print(response.statusCode);

        throw NotFoundException();
      }
      else if (response.statusCode == 200) {
        return parsedJson(response.body);

      } else {
        throw NetworkException();

      }
    } catch (e) {
      if(e is NotFoundException){
        throw NotFoundException();
      }else {
        throw NetworkException();
      }
    }
  }

  WeatherData parsedJson(final response) {
    final responseJson = json.decode(response);
    return WeatherData.fromJson(responseJson);
  }
}