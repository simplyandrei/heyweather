import 'dart:convert';
import 'package:heyweather/services/weatherModel.dart';
import 'package:http/http.dart' as http;

class WeatherService {

  final String apiKey;
  final String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  WeatherService(this.apiKey);

  Future<Weathermodel> fetchWeather(String city) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl?q=$city&appid=$apiKey&units=metric'));

      if (response.statusCode == 200) {
        return Weathermodel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      throw Exception('Error fetching weather: $e');
    }
  }

  Future<String> getCurrentCity() async {
    // This is a placeholder. You can implement a method to get the user's current city.
    return 'Cebu';
  }
}