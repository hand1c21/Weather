import 'dart:convert';
// import 'dart:core' hide String;
// import 'dart:core' as core;
// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';
import 'package:http/http.dart'as http;
import 'package:weather_app_api/models/weather_model.dart';


class WeatherService{
  static const BASE_URL='https://api.openweathermap.org/data/2.5/weather';
  static const GEO_URL='https://api.openweathermap.org/geo/1.0/direct';

  final String apikey;

  WeatherService(this.apikey);

  Future <Weather>getWeather(String cityName)async{
   final response = await http.get(Uri.parse('$BASE_URL?q=$cityName&appid=$apikey&units=metric')); 

   if(response.statusCode==200){
    return Weather.fromJson(jsonDecode(response.body));
   }
   else{
     throw Exception("Failed to load weather data");
   }
    }
    
Future <List<String>>grtCutySuggestion(String query)async{
    final response=await http.get(Uri.parse('$GEO_URL?q=$query&limit=5&appid=$apikey'));

    if(response.statusCode==200){
      final List data=jsonDecode(response.body);
      return data.map<String>((json)=>['name']as String).toList();
   }
   else{
     throw Exception("Failed to fetch city suggestions");
   }
    }
  


}
