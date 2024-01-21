import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:wetherandapi/Response/WeatherModelJson.dart';
import 'package:wetherandapi/screen/WeatherPage.dart';
import 'package:wetherandapi/services/Reprosatory/WeatherReprosatory.dart';

class GetPosition extends StatefulWidget {
  @override
  State<GetPosition> createState() {
    return GetPositionState();
  }
}

class GetPositionState extends State<GetPosition> {
  @override
  void initState() {
//this line get from package
    //اللينك اللي اشتغلنا عليه
    //https://pub.dev/packages/geolocator
    // Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    getPosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool show=true;

    return SpinKitRotatingCircle(

      color: Colors.black87,
      size: 10.0,
    );
  }

  Future<void> getPosition() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.latitude.toString() +
        '************' +
        position.longitude.toString());
//get data of get type
    //Uri.parse مسول عن الشكل بتاعه وترتيبه
    //callllllllllll apiiiiiiiiiii
//get response from api
   WeatherModelJson response =await WeatherReprosatory().getWeather(position.latitude, position.longitude);
    //MaterialPageRoute(builder: (context => Weather()));
   await Navigator.push(context, MaterialPageRoute(
      builder: (context) =>
          WeatherPage(responseModel: response,),
      ),
    );
    //to decode file because backend developer was encoded it
   // var decodeData = jsonDecode(response.body);
    //same name of (coord) in json file to get latitude and longitude
    //print(WeatherModelJson.fromJson(decodeData));
   // print('response${response.body}');
  }
}
