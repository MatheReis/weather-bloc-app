import 'package:flutter/material.dart';
import 'package:weather_app/data/models/weather.dart';

class WeatherCard extends StatelessWidget {
  final Weather weather;
  const WeatherCard({super.key, required this.weather});

  Widget _buildWeatherIcon(double tempC) {
    if (tempC < 15) {
      return const Icon(Icons.ac_unit, size: 25, color: Colors.blue);
    } else if (tempC > 25) {
      return const Icon(Icons.wb_sunny, size: 25, color: Colors.orange);
    } else {
      return const Icon(Icons.cloud, size: 25, color: Colors.lightBlue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildWeatherIcon(weather.current!.tempC!),
                  const SizedBox(width: 10),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 200),
                    child: Text(
                      weather.location!.name!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Temperatura: ${weather.current!.tempC!}°C',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'País: ${weather.location!.country!}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
