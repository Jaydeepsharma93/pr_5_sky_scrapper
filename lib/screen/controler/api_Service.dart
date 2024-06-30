import 'package:http/http.dart' as http;

class ApiServices {
  static final ApiServices apiservice = ApiServices._singleton();

  ApiServices._singleton();

  Future<String?> getData(String query) async {
    String finalQuery = query.isNotEmpty ? query : 'Surat';
    String apiData =
        'https://api.weatherapi.com/v1/forecast.json?key=dbc1ca4c223f47da9e3180308242606&q=$finalQuery';
    Uri uri = Uri.parse(apiData);
    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }
}
