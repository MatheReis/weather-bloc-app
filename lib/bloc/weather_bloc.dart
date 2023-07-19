import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_event.dart';
import 'package:weather_app/bloc/weather_state.dart';
import 'package:weather_app/data/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository) : super(WeatherInitialState()) {
    on<FetchWeatherEvent>(_onFetchWeatherEvent);
  }

  Future<void> _onFetchWeatherEvent(
    FetchWeatherEvent event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherLoadingState());
    try {
      final weather = await weatherRepository.getWeather(event.cityName);
      emit(WeatherLoadedState(weather));
    } catch (e) {
      emit(WeatherErrorState('Failed to fetch weather data.'));
    }
  }
}
