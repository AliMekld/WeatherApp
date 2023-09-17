// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weatherapp/Models/WeatherModel.dart';
import 'package:weatherapp/Models/sevenDayesWeatherModel.dart';

import 'constants/widgets/DefualtTextOne.dart';
import 'constants/widgets/WeatherBody.dart';
import 'constants/widgets/dayItem.dart';

// ignore: must_be_immutable
class WeatherInfoPage extends StatelessWidget {
  late final WeatherModel weatherModel;
  late final List<DayWeather> sevenDaysWeather;

  WeatherInfoPage(
      {super.key, required this.weatherModel, required this.sevenDaysWeather});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: WeatherBody(context, weatherModel),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  DefualTextOne(
                    text: 'Seven Dayes Weather ',
                    color: Colors.white,
                    textSize: 24,
                  ),
                ],
              )),
        ),
      ),
      SliverToBoxAdapter(
        child: SizedBox(
          width: double.infinity,
          height: 250,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: sevenDaysWeather.length,
              itemBuilder: (context, index) => dayItem(
                    index: index,
                    sevenDayesWeather: sevenDaysWeather,
                  )),
        ),
      ),
      SliverToBoxAdapter(
        child: Container(
            padding: const EdgeInsets.all(20),
            child: SfCartesianChart(
              primaryYAxis: CategoryAxis(),
              primaryXAxis: CategoryAxis(
                title: AxisTitle(text: 'name'),
                associatedAxisName: 'name',
              ),
              backgroundColor: getColor(weatherModel.condition),
              borderColor: getColor(weatherModel.condition),
            )),
      ),
    ]);
  }
}
