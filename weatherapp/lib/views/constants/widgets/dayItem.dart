import 'package:flutter/material.dart';

import '../../../Models/sevenDayesWeatherModel.dart';
import 'DefualtTextOne.dart';

class dayItem extends StatelessWidget {
  final int index;
  final List<DayWeather> sevenDayesWeather;
  const dayItem({required this.index, required this.sevenDayesWeather});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          border:
              Border.all(color: getColor(sevenDayesWeather[index].condition)),
          color: getColor(sevenDayesWeather[index].condition),
          borderRadius: BorderRadius.circular(
            20,
          )),
      width: MediaQuery.of(context).size.width * 0.3,
      margin: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: getColor(sevenDayesWeather[index].condition)),
                color: getColor(sevenDayesWeather[index].condition),
                borderRadius: BorderRadius.circular(6)),
            padding: const EdgeInsets.all(8),
            child: DefualTextOne(
                text: sevenDayesWeather[index].date, color: Colors.white),
          ),
          DefualTextOne(
              text: 'Temp : ${sevenDayesWeather[index].temp}',
              color: Colors.white),
          Image(
              image: NetworkImage('https:${sevenDayesWeather[index].imgUrl}')),
          DefualTextOne(
              text: sevenDayesWeather[index].condition, color: Colors.white),
          DefualTextOne(
              text: 'Max : ${sevenDayesWeather[index].maxTemp}',
              color: Colors.white70),
          DefualTextOne(
              text: 'Min : ${sevenDayesWeather[index].minTemp}',
              color: Colors.green),
        ],
      ),
    );
  }
}

Color getColor(String cond) {
  if (cond.contains('Sunny')) {
    return Colors.yellow.withOpacity(0.3);
  } else if (cond.contains('Cloudy')) {
    return Colors.blueGrey.shade700.withOpacity(0.3);
  } else if (cond.contains('Partly cloudy')) {
    return Colors.lightBlue.withOpacity(0.3);
  } else if (cond.contains('rain')) {
    return Colors.blueGrey.shade400.withOpacity(0.3);
  } else {
    return Colors.transparent;
  }
}
