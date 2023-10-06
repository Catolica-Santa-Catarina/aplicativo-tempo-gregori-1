import 'package:tempo_template/models/location.dart';
import 'package:tempo_template/models/weather_data.dart';
import 'package:tempo_template/utilities/constants.dart';

import 'location_service.dart';
import 'networking.dart';

class WeatherService {
  Future<Location> getLocation() async {
    var locationService = LocationService();
    var location = await locationService.getCurrentLocation();
    return location;
  }

  Future<WeatherData> getLocationWeather() async {
    var location = await getLocation();

    var url =
        '$openWeatherUrl?lat=${location.latitude}&lon=${location.longitude}'
        '&appid=$apiKey&units=metric';

    var jsonData = await NetworkHelper(url).getData();
    var weatherData = WeatherData.fromJson(jsonData);

    return weatherData;
  }

  Future<WeatherData> getCityWeather(String cityName) async {
    var url = '$openWeatherUrl?q=$cityName&appid=$apiKey&units=metric';

    var jsonData = await NetworkHelper(url).getData();
    var weatherData = WeatherData.fromJson(jsonData);

    return weatherData;
  }
}
