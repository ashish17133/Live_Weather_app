import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'main.dart';

class WeatherReport {
  dynamic cityname;
  dynamic dateToday;
  dynamic tempToday;
  dynamic weatherType;
  dynamic windSpeed;
  dynamic rainvalue;
  dynamic humidity;
  dynamic backimage;
}

WeatherReport dataa = WeatherReport();

Future<void> getInternetValue(String cityName) async {
  //date time conversion

  http.Response dateTime =
      await http.get("https://worldtimeapi.org/api/timezone/asia/kathmandu");
  dynamic cdateTime = jsonDecode(dateTime.body);

  print(cdateTime['datetime']);

  //weather convertor
  http.Response data = await http.get(
      "https://api.openweathermap.org/data/2.5/weather?q=${cityName},np%20&appid=d80050c02fe33178ee0ba48cb2d0e424");
  dynamic cdata = jsonDecode(data.body);
  print(cdata);

  dataa.cityname = cdata["name"];

  dataa.dateToday = cdateTime["datetime"];
  dataa.humidity = cdata["main"]["humidity"];
  dataa.weatherType = cdata["weather"][0]["description"];
  dataa.windSpeed = cdata['wind']['speed'];
  dataa.tempToday = (cdata['main']['temp'] - 273).round();

  String imageDecider = cdata["weather"][0]["main"];

  if (imageDecider == "clouds" ||
      imageDecider == "Clouds" ||
      imageDecider == "CLOUDS") {
    dataa.backimage = "backRain";
  } else if (imageDecider == "sunny" ||
      imageDecider == "sun" ||
      imageDecider == "SUNNY" ||
      imageDecider == "Sunny" ||
      imageDecider == "Clear") {
    dataa.backimage = "backSun";
  } else {
    dataa.backimage = "backFoggy";
  }

  print("${dataa.backimage}");
  print("${cityName}");
  // print(dataa.cityname);
  //print(dataa.dateToday);
  //print(dataa.humidity);
  //print(dataa.weatherType);
  //print(dataa.windSpeed);
  //print(dataa.tempToday.round());
}
