import 'dart:convert';
import 'package:flutter/cupertino.dart';
import '../controler/api_service.dart';
import '../model/modaleclass.dart';

class WeatherProvider extends ChangeNotifier {
  Weather? weather;
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
    }

    isLoading = false;
    notifyListeners();
  }
}
