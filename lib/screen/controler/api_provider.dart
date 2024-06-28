import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:pr_5_sky_scrapper/screen/controler/api_Service.dart';
import 'package:pr_5_sky_scrapper/screen/model/modaleclass.dart';

class WeatherProvider extends ChangeNotifier {
  Weather? weather;
  DateTime dateTime = DateTime.now();
  bool isLoading = false;

  WeatherProvider() {
    fetchData('Surat');
  }

  Future<void> fetchData(String query) async {
    isLoading = true;
    notifyListeners();

    String? jsonData = await ApiServices.apiservice.getData(query);

    if (jsonData != null) {
      Map dataList = jsonDecode(jsonData);
      weather = Weather.getData(dataList);
      print("Called successfully");
      print(jsonData);

      isLoading = false;
      notifyListeners();
    }
  }
}

// class ApiProvider extends ChangeNotifier {
//   Weather? weather;
//   DateTime dateTime = DateTime.now();
//   bool isLoading = false;
//
//   ApiProvider() {
//     fetchData('Surat');
//   }
//
//   Future<void> fetchData(String place) async {
//     isLoading = true;
//     notifyListeners();
//
//     String? jsonData = await ApiService.apiService.getData(place);
//
//     if (jsonData != null) {
//       Map dataList = jsonDecode(jsonData);
//       weather = Weather.getData(dataList);
//       print("Called successfully");
//       print(jsonData);
//
//       isLoading = false;
//       notifyListeners();
//     }
//   }
// }
