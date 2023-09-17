// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubit/cubit/getWeatherCubit.dart';
import 'package:weatherapp/views/constants/widgets/DefualtTextOne.dart';
import 'package:weatherapp/views/constants/widgets/dayItem.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: getColor('rain'),
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: DefualTextOne(text: "Search A City", color: Colors.white)),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: TextFormField(
            style: const TextStyle(color: Colors.white70),
            onFieldSubmitted: (value) async {
              if (value.isEmpty) {
                //or validator
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  content: DefualTextOne(
                      text: ' No City Founded !', color: Colors.white),
                ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.green,
                    content: DefualTextOne(text: value, color: Colors.white)));
                await BlocProvider.of<GetWeatherCubit>(context, listen: false)
                    .getWeather(cityname: value);
                await BlocProvider.of<GetWeatherCubit>(context, listen: false)
                    .getsevendayWeather(cityname: value);
                Navigator.pop(context);
              }
            },
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.white70)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.green)),
              labelText: 'Search here',
              hintStyle: const TextStyle(color: Colors.white70),
              labelStyle: const TextStyle(color: Colors.white70),
              hintText: 'Enter city name',
              suffixIcon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
        ));
  }
}
