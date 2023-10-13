import 'package:flutter/material.dart';
import 'package:homebase_weatherapp/pages/data_page/data_page_widgets_regular/place_data_time_information.dart';
import 'package:homebase_weatherapp/pages/data_page/data_page_widgets_regular/pressure_information.dart';
import 'package:homebase_weatherapp/pages/data_page/data_page_widgets_regular/sun_times_banner.dart';
import 'package:homebase_weatherapp/pages/data_page/data_page_widgets_regular/weather_description.dart';

import '../../../blocs/weather_bloc/weather_bloc.dart';

import 'icon_degree_banner.dart';


class DataPageContent extends StatelessWidget {
  const DataPageContent({
    super.key,
    required this.cityName,
    required this.state,
  });

  final String cityName;
  final SearchedState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            PlaceDataTimeInformation(
              cityName: cityName,
            ),
            const SizedBox(
              height: 30,
            ),
            IconDegreeBanner(
              icon: state.weatherModel.icon,
              temperature: state.weatherModel.temperature,
            ),
            const SizedBox(
              height: 30,
            ),
            WeatherDescription(
              description: state.weatherModel.description,
            ),
            const SizedBox(
              height: 40,
            ),
            PressureInformation(
              pressure: state.weatherModel.pressure,
            ),

            const SizedBox(
              height: 30,
            ),
            SunTimesBanner(
              sunrise: state.weatherModel.sunrise,
              sunset: state.weatherModel.sunset,
            ),




          ],
        ),
      ),
    );
  }
}