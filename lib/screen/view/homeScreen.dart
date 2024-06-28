import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controler/api_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherProvider weatherProvider = Provider.of<WeatherProvider>(context);
    WeatherProvider weatherProviderfalse = Provider.of<WeatherProvider>(context,listen: false);
    TextEditingController searchController = TextEditingController(text: 'Surat');

    String backgroundImage = 'assets/img/3.gif'; // Default image
    if (weatherProvider.weather != null) {
      String condition = weatherProvider.weather!.currentModal.conditionModel.text.toLowerCase();
      if (condition.contains('partly cloudy')) {
        backgroundImage = 'assets/img/2.gif'; // Replace with your partly cloudy image path
      } else if (condition.contains('rain')) {
        backgroundImage = 'assets/img/3.gif'; // Replace with your rain image path
      }
      // Add more conditions as needed
    }
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backgroundImage),fit: BoxFit.fill
          )
        ),
      ),
    );
  }
}
