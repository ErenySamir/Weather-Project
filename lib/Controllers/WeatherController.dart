import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:wetherandapi/Response/WeatherModelJson.dart';


class WeatherController extends GetxController{
  var WeatherTxt="".obs;
  //في خاله هستقبل الموديل كله وهيحصل فيه تغيير
  var weatherModel=WeatherModelJson().obs;
  //return type of all model after being parsed and decoded
 getWeatherController(String country) async{
    http.Response responseCountry = await get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?APPID=36b5be62675182f8d2b267464b49c2ff&units=metic&q=${country}'
    ));
WeatherTxt.value =WeatherModelJson.fromJson(jsonDecode(responseCountry.body)).weather![0].description.toString();
//update fun in getex هنا بيكون ملهاش لازمه لو هستخدم واحد بس
update();
  }
}