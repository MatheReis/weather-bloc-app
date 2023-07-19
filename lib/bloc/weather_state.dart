import 'package:weather_app/data/models/weather.dart';

abstract class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final Weather weather;

  WeatherLoadedState(this.weather);
}

class WeatherErrorState extends WeatherState {
  final String message;

  WeatherErrorState(this.message);
}
