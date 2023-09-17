// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubit/cubit/getWeatherCubit.dart';
import 'package:weatherapp/cubit/states/getWeatherStates.dart';
import 'package:weatherapp/views/constants/colors/mtColors.dart';
import 'package:weatherapp/views/constants/widgets/DefualtTextOne.dart';
import 'package:weatherapp/views/noWeatherBody.dart';
import 'package:weatherapp/views/searchPAge.dart';
import 'package:weatherapp/views/weatherInfo.dart';
import 'ErrorPage.dart';

class Home extends StatefulWidget {
  Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controller = TextEditingController();
  // ignore: recursive_getters
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                centerTitle: true,
                title: DefualTextOne(
                  text: 'Weather App',
                  color: Colors.white,
                  textSize: 22,
                ),
                elevation: 0,
                backgroundColor: MyColors.mainColor,
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SearchPage()));
                      },
                      icon: const Icon(Icons.search))
                ]),
            backgroundColor: MyColors.mainColor,
            body: BlocBuilder<GetWeatherCubit, GetWeatherStates>(
              builder: (context, state) {
                if (state is InitialWeatherState) {
                  return const noWearherBody();
                } else if (state is WeatherLoadedState) {
                  // var weatherModel =
                  //     BlocProvider.of<GetWeatherCubit>(context).weatherModel;
                  // var sevenDaysWeather =
                  //     BlocProvider.of<GetWeatherCubit>(context)
                  //         .sevendaysWeather;
                  return WeatherInfoPage(

                      // error
                      //because the data come with null at first time
                      weatherModel: BlocProvider.of<GetWeatherCubit>(context)
                          .weatherModel!,
                      //solution is to make Weatherloadedstate take the weather model in its constructor
                      //But i have two models  (1-sevendaysWeather) and (2-weathermodel).....so...!!!
                      sevenDaysWeather:
                          BlocProvider.of<GetWeatherCubit>(context)
                              .sevendaysWeather!);
                } else if (state is WeatherFuliureState) {
                  return ErrorPage(
                    error: state.error,
                  );
                } else {
                  //still loading data
                  return const Center(child: CircularProgressIndicator());
                }
              },
            )));
  }
}
