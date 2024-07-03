import 'package:flutter/material.dart';
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
    TextEditingController searchController = TextEditingController();

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
              const SizedBox(height: 20),
              SafeArea(
                child: Row(
                  children: [
                    const Icon(Icons.menu, size: 35, color: Colors.white),
                    const SizedBox(width: 25),
                    Text(
                      weatherProvider.weather!.locationModal.name.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          letterSpacing: 1,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.location_on,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    // Replace Spacer with an Icon or SizedBox
                    hintText: 'Search City',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10)),
                onFieldSubmitted: (value) {
                  weatherProviderFalse.fetchData(searchController.text);
                  searchController.clear();
                },
              ),
              const SizedBox(height: 60),
              Text(
                "${weatherProvider.weather!.currentModal.tempC.toInt()}°",
                style: const TextStyle(fontSize: 100, color: Colors.white),
              ),
              Row(
                children: [
                  Text(
                    weatherProvider.weather!.currentModal.conditionModel.text,
                    style: const TextStyle(
                        color: Colors.white,
                        letterSpacing: 1,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 25),
                  Image.network(
                    'https:${weatherProvider.weather!.currentModal.conditionModel.icon}',
                    height: 45,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return const Icon(Icons.error, color: Colors.red);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Text(
                '${weatherProvider.weather!.currentModal.tempC.toInt()}° / ${weatherProvider.weather!.currentModal.feelsLikeC.toInt()}° Feels like',
                style: const TextStyle(
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
