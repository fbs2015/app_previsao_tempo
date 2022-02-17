import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_weather/model/weather.dart';

class DataService{

  Future<Weather> fetchData(String cityName) async {    
    try {
      final queryParameters = {
      'q' : cityName,
      'appid' : 'abd6b44fef49dd20f9e0d7c03947fbf7',
      'units' : 'metric',
      };
      final uri = Uri.https('api.openweathermap.org','/data/2.5/weather', queryParameters);
      final response = await http.get(uri);

      if (response.statusCode == 200 ){
        return Weather.fromJson(jsonDecode(response.body));
      }else{
        throw Exception('Failed to load Data!');
      }
    } catch (e) {
      rethrow;
    }  
  }
}