import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wetherandapi/Response/WeatherModelJson.dart';
import 'package:country_picker/country_picker.dart';
import 'package:wetherandapi/services/Reprosatory/CountryWeatherReposatory.dart';

class WeatherPage extends StatefulWidget {
  //constructor of weather page
  //WeatherModelJson استخدمت ده بدل var
  //عشان يطلع الحاجات اللي جواه لما احط دوت
  WeatherModelJson responseModel;
  WeatherPage({required this.responseModel});

  @override
  State<WeatherPage> createState() {
    return WeatherPageState();
  }
}

class WeatherPageState extends State<WeatherPage> {
  @override
  void initState() {
    print(widget.responseModel.name);
    super.initState();
  }

  String WeatherIcon() {
    //check tempreature
    if (widget.responseModel.weather![0].main == "cold") {
      return '☁ ';
    }
    if (widget.responseModel.weather![0].main == "Rain") {
      return '🌧⛈';
    }
    if (widget.responseModel.weather![0].main == "Clear") {
      return '🌞';
    }
    return '🌈';
  }

  String getTemperature() {
    if (widget.responseModel.main!.temp! > 12.0) {
      return "It's Raining";
    } else if (widget.responseModel.main!.temp! < 32.0) {
      return "It's Cold";
    } else if (widget.responseModel.main!.temp == 2.0) {
      return "It's Clean ";
    }
    return " Normal ";
  }
//***********************************************************************************
  final CountryWeatherReposatory weatherRepository = CountryWeatherReposatory();
  WeatherModelJson? weatherDataModel;
   fetchWeatherData(String country) async {
      WeatherModelJson weatherData = await CountryWeatherReposatory().getCountryWeather(country);
      setState(() {
        widget.responseModel = weatherData;
      });
  }
//***********************************************************************************
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.0),
          image: DecorationImage(
            image: AssetImage(
              'assets/images/sky.jpg',
            ),
            colorFilter: ColorFilter.mode(
              Colors.white60.withOpacity(0.9),
              BlendMode.saturation,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                WeatherIcon(),
                style: TextStyle(fontSize: 90),
              ),
            ),
            Center(
              child: Text(getTemperature()),
              //Pickkkkkkkkkkkkkkker    to select country from api
            ),ElevatedButton(onPressed: (){
              showCountryPicker(
                context: context,
                showPhoneCode: true, // optional. Shows phone code before the country name.
                onSelect: (Country country) async {
                  await fetchWeatherData(country.name);
                  print('Select country: ${country.displayName}');
                },
              );
            }, child:Text('Select'))
          ],
        ),
      ),
    );
  }
}