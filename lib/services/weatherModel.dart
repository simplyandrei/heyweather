class Weathermodel {
  String? cityName;
  double? temperature;
  String? weatherDescription;

  Weathermodel({
    this.cityName,
    this.temperature,
    this.weatherDescription
  });

  factory Weathermodel.fromJson(Map<String, dynamic> json) {
    return Weathermodel(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(), // Convert from Kelvin to Celsius
      weatherDescription: json['weather'][0]['main'],
    );
  }
}