class GetWeatherStates {}

class InitialWeatherState extends GetWeatherStates {}

class WeatherLoadedState extends GetWeatherStates {}

class WeatherFuliureState extends GetWeatherStates {
  final String error;
  WeatherFuliureState(this.error);
}
