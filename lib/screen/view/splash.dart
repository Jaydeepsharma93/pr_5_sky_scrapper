import 'package:flutter/material.dart';
import 'package:pr_5_sky_scrapper/screen/view/homeScreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 4),() {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen(),));
    },);
    return Scaffold(
      body: Center(child: Image.asset('assets/img/logo.png')),
    );
  }
}
