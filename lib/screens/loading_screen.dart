import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tempo_template/models/weather_data.dart';
import 'package:tempo_template/screens/location_screen.dart';
import 'package:tempo_template/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future<void> getWeatherData() async {
    var weatherData = await WeatherService().getLocationWeather();
    pushToLocationScreen(weatherData);
  }

  void pushToLocationScreen(WeatherData weatherData) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => LocationScreen(
                weatherData: weatherData,
              )),
    );
  }

  @override
  void initState() {
    super.initState();
    getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
