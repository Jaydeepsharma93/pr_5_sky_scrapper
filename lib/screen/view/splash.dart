import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'homeScreen.dart';
import '../controler/api_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherProvider weatherProviderTrue = Provider.of<WeatherProvider>(context);
    Future.delayed(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            weatherProvider: weatherProviderTrue,
          ),
        ),
      );
    });

    return Scaffold(
      body: Center(
        child: Image.asset('assets/img/logo.png'),
      ),
    );
  }
}
