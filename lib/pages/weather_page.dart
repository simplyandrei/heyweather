import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class WeatherPage extends StatefulWidget {
  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Cebu",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Lottie.asset(
                'assets/thunderstorm.json',
              ),
              Text(
                "Thunderstorm",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w200,
                ),
              ),
              Text(
                "27°C",
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
}
