import 'package:flutter/material.dart';
import 'package:open_weather_example_flutter/src/constants/app_colors.dart';
import 'package:open_weather_example_flutter/src/features/weather/presentation/city_search_box.dart';
import 'package:open_weather_example_flutter/src/features/weather/presentation/current_weather.dart';
import 'package:open_weather_example_flutter/src/features/weather/presentation/hourly_weather.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key, required this.city});
  final String city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.rainGradient,
          ),
        ),
        child: SafeArea(
          child: ListView(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            children: [
              // Removed the header with city name
              const SizedBox(height: 20.0), // Space above the search box

              // City search box
              const CitySearchBox(),
              const SizedBox(
                  height: 20.0), // Space between search box and current weather

              // Current weather card
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CurrentWeather(),
                ),
              ),
              const SizedBox(
                  height:
                      20.0), // Space between current weather and hourly weather

              // Hourly weather card
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: HourlyWeather(),
                ),
              ),
              const SizedBox(height: 20.0), // Space at the bottom
            ],
          ),
        ),
      ),
    );
  }
}
