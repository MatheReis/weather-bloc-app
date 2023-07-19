import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/data/weather_api.dart';

class WeatherRepository {
  final WeatherApi weatherApi;

  WeatherRepository(this.weatherApi);

  Future<Weather> getWeather(String cityName) {
    return weatherApi.fetchWeather(cityName);
  }
}
