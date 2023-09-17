import 'package:flutter/material.dart';
import 'package:weatherapp/views/constants/widgets/dayItem.dart';

import '../../../Models/WeatherModel.dart';
import 'DefualtTextOne.dart';

// ignore: non_constant_identifier_names
Container WeatherBody(BuildContext context, WeatherModel weatherModel) {
  return Container(
    margin: const EdgeInsets.all(20),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
        color: getColor(weatherModel.condition),
        borderRadius: BorderRadius.circular(20)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            DefualTextOne(
              text: weatherModel.cityName,
              color: Colors.primaries.first,
              textSize: 32,
            ),
            DefualTextOne(
              text: "last Update :${weatherModel.date}",
              color: Colors.white60,
              textSize: 16,
            ),
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 1,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 1,
                child: Image(
                  image: NetworkImage('https:${weatherModel.imgUrl!}'),
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                  flex: 1,
                  child: DefualTextOne(
                    text: weatherModel.temp.toString(),
                    color: Colors.pink,
                    textSize: 60,
                  )),
              Column(
                children: [
                  DefualTextOne(
                      text: 'MaxTemp   :${weatherModel.maxTemp}',
                      color: const Color.fromARGB(255, 81, 74, 74)),
                  DefualTextOne(
                      text: 'MinTemp    : ${weatherModel.minTemp}',
                      color: Colors.white),
                ],
              ),
            ],
          ),
        ),
        DefualTextOne(
          text: weatherModel.condition,
          color: Colors.white,
          textSize: 32,
        ),
      ],
    ),
  );
}
