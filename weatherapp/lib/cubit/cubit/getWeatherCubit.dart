import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Models/WeatherModel.dart';
import 'package:weatherapp/Models/sevenDayesWeatherModel.dart';
import 'package:weatherapp/cubit/states/getWeatherStates.dart';
import '../../WebServies(Api)/WeatherApi/WebService(Api).dart';

class GetWeatherCubit extends Cubit<GetWeatherStates> {
  GetWeatherCubit() : super(InitialWeatherState());
  WeatherModel? weatherModel;
  List<DayWeather>? sevendaysWeather;
  getWeather({required String cityname}) async {
    try {
      weatherModel =
          await WebService(dio: Dio()).getCurrentWeather(city: cityname);
      emit(WeatherLoadedState());
    } catch (e) {
      emit(WeatherFuliureState(e.toString()));
    }
  }

  getsevendayWeather({required String cityname}) async {
    try {
      sevendaysWeather =
          await WebService(dio: Dio()).getSevenDayesWeather(city: cityname);
      emit(WeatherLoadedState());
    } catch (e) {
      emit(WeatherFuliureState(e.toString()));
    }
  }
}
