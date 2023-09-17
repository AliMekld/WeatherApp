import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weatherapp/Models/sevenDayesWeatherModel.dart';
import '../../Models/WeatherModel.dart';

class WebService {
  WebService({required this.dio});
  final Dio dio;
//get current weather method
  Future<WeatherModel> getCurrentWeather({required String city}) async {
    try {
      Response response = await dio.get(
          'https://api.weatherapi.com/v1/forecast.json?key=b653d3064a554c1a8b1213521230709&q=$city&days=1#');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage =
          //handiling exception
          await e.response?.data['error']['message'] ?? "error try later";
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());

      throw Exception(e.toString());
    }
  }

//get list of(7)dayes weather for certain city ----
  Future<List<DayWeather>> getSevenDayesWeather({required String city}) async {
    try {
      Response response = await dio.get(
          'https://api.weatherapi.com/v1/forecast.json?key=b653d3064a554c1a8b1213521230709&q=$city&days=7&aqi=no&alerts=no');
      List<dynamic> jsonData = response.data['forecast']['forecastday'] as List;
      List<DayWeather> sevenDayesWeatheList = [];
      //maping each item in the jsondata list and convert it into object of weatherdaymodel
      for (var day in jsonData) {
        DayWeather dayWeather = DayWeather(
            date: day['date'],
            temp: day['day']['avgtemp_c'],
            maxTemp: day['day']['maxtemp_c'],
            minTemp: day['day']['mintemp_c'],
            condition: day['day']['condition']['text'],
            imgUrl: day['day']['condition']['icon']);
        sevenDayesWeatheList.add(dayWeather);
        //----------------------another way will test it later------------------------------------//
        // jsonData
        //     .map((e) => {
        //           sevenDayesWeatheList.add(
        //             DayWeather(
        //                 date: e['date'],
        //                 temp: e['day']['avgtemp_c'],
        //                 maxTemp: e['day']['maxtemp_c'],
        //                 minTemp: e['day']['mintemp_c'],
        //                 condition: e['day']['condition']['text'],
        //                 imgUrl: e['day']['condition']['icon']),
        //           )
        //         })
        //     .toList();
        //---------------------------------------------------------------------------------------//
      }
      return sevenDayesWeatheList;
    } on Exception catch (e) {
      e;
      return [];
    }
  }
}
