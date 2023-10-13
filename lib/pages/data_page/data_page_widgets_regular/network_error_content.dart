import 'package:flutter/material.dart';
import 'package:homebase_weatherapp/pages/data_page/data_page_widgets_regular/weather_data_back_button.dart';

class NetworkErrorContent extends StatelessWidget {
  const NetworkErrorContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/cloud_questionmark.png',
          width: MediaQuery.of(context).size.width / 2,
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          "Check your internet.\nCome back later.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        const WeatherDataBackButton(),
      ],
    );
  }
}
