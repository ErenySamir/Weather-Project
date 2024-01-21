import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wetherandapi/Controllers/WeatherController.dart';
import 'package:wetherandapi/Response/WeatherModelJson.dart';
import 'package:wetherandapi/screen/WeatherPage.dart';
import 'package:wetherandapi/services/Reprosatory/WeatherReprosatory.dart';

class CallGetex extends StatelessWidget {
  //call class WeatherController
  final WeatherController controller=Get.put(WeatherController());
  @override
  Widget build(BuildContext context) {
    bool show = true;

    return Column(
      children: [
        Container(
          child: Obx(() {
            return Text(
              // get the text from weathercontroller
              controller.WeatherTxt.value,
            );
          }),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            onPressed: () {
              //لو عايوه اغير في الداتا بتاعه api
              controller.WeatherTxt.value="data changed";
            },
            child: Text("Change"),
          ),
        ),
      ],
    );
  }
  }

