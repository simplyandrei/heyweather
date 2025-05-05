import 'package:flutter/material.dart';
import 'package:heyweather/services/weatherModel.dart';
import 'package:heyweather/services/weatherService.dart';
import 'package:lottie/lottie.dart';


class WeatherPage extends StatefulWidget {
  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // api key
  final _weatherService = WeatherService('a67ffe73ea5c6a1f18336556d9d0f297');
  Weathermodel? _weather;

  // fetch weather
  _fetchWeather() async {
    String city = await _weatherService.getCurrentCity();
    try {
      final weather = await _weatherService.fetchWeather(city);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  // weather animations
  String getWeatherAnimation(String weatherDescription) {
    switch (weatherDescription) {
      case 'clouds':
        return 'assets/clouds.json';
      case 'mist':
        return 'assets/mist.json';
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/clouds.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/rain.json';
      case 'thunderstorm':
        return 'assets/thunderstorm.json';
      case 'clear':
        return 'assets/sunny.json';
      default:
        return 'assets/sunny.json';
    }
  }

  // init state
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _fetchWeather();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _weather?.cityName ?? "",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Lottie.asset(
                getWeatherAnimation(_weather?.weatherDescription ?? "")
              ),
              Text(
                _weather?.weatherDescription ?? "",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w200,
                ),
              ),
              Text(
                _weather?.temperature != null
                    ? "${_weather?.temperature?.toStringAsFixed(1)}°C"
                    : "",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      )
    );
  }

  // a67ffe73ea5c6a1f18336556d9d0f297
}
