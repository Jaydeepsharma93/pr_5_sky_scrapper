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
    WeatherProvider weatherProviderfalse =
        Provider.of<WeatherProvider>(context, listen: false);
    TextEditingController searchController =
        TextEditingController(text: 'Surat');

    String backgroundImage = 'assets/img/3.gif'; // Default image
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
                      'Surat',
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
                    prefixIcon: Spacer(),
                    suffixIcon: Icon(Icons.search),
                    hintText: 'Search City',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    contentPadding: EdgeInsets.symmetric(vertical: 10)),
                onFieldSubmitted: (value) {
                  searchController.clear();
                },
              ),
              SizedBox(height: 60),
              Text(
                '31°',
                style: TextStyle(fontSize: 100, color: Colors.white),
              ),
              Row(
                children: [
                  Text(
                    'Mostly Cloudy',
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 25),
                  Image.network('https://cdn.weatherapi.com/weather/64x64/day/353.png',height: 45,)
                ],
              ),
              SizedBox(height: 25),
              Text(
                '32° / 27° Feels like',
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
