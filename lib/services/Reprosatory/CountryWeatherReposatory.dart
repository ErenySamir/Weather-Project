import 'dart:convert';

import 'package:http/http.dart';

import '../../Response/WeatherModelJson.dart';
import 'package:http/http.dart' as http;

class CountryWeatherReposatory{
//return type of all model after being parsed and decoded
  Future<WeatherModelJson>getCountryWeather(String country) async{
    http.Response responseCountry = await get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?APPID=36b5be62675182f8d2b267464b49c2ff&units=metic&q=${country}'
    ));

    return WeatherModelJson.fromJson(jsonDecode(responseCountry.body));
  }
}