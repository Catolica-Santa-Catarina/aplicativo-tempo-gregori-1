class WeatherData {
  final String cityName;
  final int temp;
  final int condition;

  WeatherData({
    required this.cityName,
    required this.temp,
    required this.condition,
  });

  factory WeatherData.fromJson(Map<String, dynamic> jsonData) {
    return WeatherData(
      cityName: jsonData['name'],
      temp: jsonData['main']['temp'].toInt(),
      condition: jsonData['weather'][0]['id'],
    );
  }

  String getWeatherIcon() {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage() {
    if (temp > 25) {
      return 'É tempo de 🍦';
    } else if (temp > 20) {
      return 'O tempo está bom para bermuda e 👕';
    } else if (temp < 10) {
      return 'Você precisará de 🧣 e 🧤';
    } else {
      return 'Leve um 🧥';
    }
  }
}
