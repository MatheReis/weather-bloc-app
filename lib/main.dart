import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/data/weather_api.dart';
import 'package:weather_app/data/weather_repository.dart';
import 'package:weather_app/screens/weather_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
        ),
        useMaterial3: true,
      ),
      home: MultiProvider(
        providers: [
          Provider<WeatherApi>(
            create: (_) => WeatherApi(),
          ),
          Provider<WeatherRepository>(
            create: (context) => WeatherRepository(
              Provider.of<WeatherApi>(context, listen: false),
            ),
          ),
          BlocProvider<WeatherBloc>(
            create: (context) => WeatherBloc(
              Provider.of<WeatherRepository>(context, listen: false),
            ),
          ),
        ],
        child: const WeatherScreen(),
      ),
    );
  }
}
