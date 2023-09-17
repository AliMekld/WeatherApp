import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/Models/WeatherModel.dart';
import 'package:weatherapp/Models/sevenDayesWeatherModel.dart';

import '../WebServies(Api)/WeatherApi/WebService(Api).dart';

class GetWeatherProvider extends ChangeNotifier {
  WeatherModel? weatherModel;
  List<DayWeather>? sevenDayesWeather;
  bool isLoading = false;

  getWeather({required String cityname}) async {
    isLoading = true;
    notifyListeners();

    try {
      weatherModel =
          await WebService(dio: Dio()).getCurrentWeather(city: cityname);
      isLoading = false;
      notifyListeners();
    } catch (e) {}
  }

  getSevenDayesWeather({required String cityname}) async {
    isLoading = true;

    notifyListeners();
    try {
      sevenDayesWeather =
          await WebService(dio: Dio()).getSevenDayesWeather(city: cityname);
      isLoading = false;

      notifyListeners();
    } catch (e) {
      e.toString();
    }
  }
}
