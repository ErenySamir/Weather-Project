import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:wetherandapi/Response/WeatherModelJson.dart';

class WeatherReprosatory {
  //return type of all model after being parsed and decoded
  Future<WeatherModelJson>getWeather(double lat ,double lon) async{
    http.Response response = await get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=36b5be62675182f8d2b267464b49c2ff&lon=31.2639488&lat=30.0122112&units=metic#'
    //'lat=${lat}&lon${lon}'
    ));

return WeatherModelJson.fromJson(jsonDecode(response.body));
  }
}