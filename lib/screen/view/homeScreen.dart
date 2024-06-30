import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../controler/api_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.weatherProvider,
  });

  final WeatherProvider weatherProvider;

  @override
  Widget build(BuildContext context) {
    WeatherProvider weatherProviderFalse =
        Provider.of<WeatherProvider>(context, listen: false);
    TextEditingController searchController =
        TextEditingController(text: 'Surat');

    String backgroundImage = 'assets/img/4.gif'; // Default image
    if (weatherProvider.weather != null) {
      String condition = weatherProvider
          .weather!.currentModal.conditionModel.text
          .toLowerCase();
      if (condition.contains('partly cloudy')) {
        backgroundImage =
            'assets/img/4.gif'; // Replace with your partly cloudy image path
      } else if (condition.contains('rain')) {
        backgroundImage =
            'assets/img/3.gif'; // Replace with your rain image path
      }
      // Add more conditions as needed
    }
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(backgroundImage), fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              SafeArea(
                child: Row(
                  children: [
                    Icon(Icons.menu, size: 35, color: Colors.white),
                    SizedBox(width: 25),
                    Text(
                      weatherProvider.weather!.locationModal.name.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.location_on,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    // Replace Spacer with an Icon or SizedBox
                    hintText: 'Search City',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    contentPadding: EdgeInsets.symmetric(vertical: 10)),
                onFieldSubmitted: (value) {
                  weatherProviderFalse.fetchData(searchController.text);
                  searchController.clear();
                },
              ),
              SizedBox(height: 60),
              Text(
                "${weatherProvider.weather!.currentModal.tempC.toInt()}°",
                style: TextStyle(fontSize: 100, color: Colors.white),
              ),
              Row(
                children: [
                  Text(
                    'Light rain shower',
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 25),
                  Image.network(
                    'https:${weatherProvider.weather!.currentModal.conditionModel.icon}',
                    height: 45,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return Icon(Icons.error, color: Colors.red);
                    },
                  ),
                ],
              ),
              SizedBox(height: 25),
              Text(
                '${weatherProvider.weather!.currentModal.tempC.toInt()}° / ${weatherProvider.weather!.currentModal.feelsLikeC.toInt()}° Feels like',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
