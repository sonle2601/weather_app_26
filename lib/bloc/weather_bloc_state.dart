part of 'weather_bloc_bloc.dart';

class WeatherBlocState extends Equatable {
  const WeatherBlocState();

  @override
  List<Object> get props => [];
}

class WeatherBlocInitial extends WeatherBlocState {}

class WeatherBlocLoading extends WeatherBlocState {}

class WeatherBlocFailure extends WeatherBlocState {}

class WeatherBlocSuccess extends WeatherBlocState {
  final Weather weather;
  final List<Weather> weatherList;

  const WeatherBlocSuccess(this.weather, this.weatherList);

  @override
  List<Object> get props => [weather, weatherList];
}

