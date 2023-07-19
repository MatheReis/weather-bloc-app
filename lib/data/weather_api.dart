import 'package:dio/dio.dart';
import 'models/weather.dart';

class WeatherApi {
  Future<Weather> fetchWeather(String cityName) async {
    final dio = Dio();
    const apiKey = '0a854bed00b44fd2891233111231807';
    final apiUrl =
        'http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$cityName&aqi=no';

    try {
      final response = await dio.get(apiUrl);
      if (response.statusCode == 200) {
        final jsonData = response.data;
        final weather = Weather.fromMap(jsonData);
        return weather;
      } else {
        throw Exception('Nenhuma cidade encontrada');
      }
    } catch (e) {
      throw Exception('Failed to fetch weather data: $e');
    }
  }
}
