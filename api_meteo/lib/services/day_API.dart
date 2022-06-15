import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/city.dart';
import '../models/city4H.dart';
import '../models/citydb.dart';

Future<City> getMainpageInfo(String city) async {
  City currentCity = new City();
  // String city = "Lyon";
  String apikey = "6919a84b76463e69ad5a578e8af8c759";
  //https://api.openweathermap.org/data/2.5/weather?q=lyon&appid=0ab41fe6a9d03611b9c79fe2fde7e059&lang=fr&unit=metric
  var url = Uri.parse(
      "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apikey&lang=fr&units=metric");
  var response = await http.get(url);

  if (response.statusCode == 200) {
    var jsonResponse = City.fromJson(jsonDecode(response.body));
    return jsonResponse;
  } else {
    print('Error: ${response.statusCode}.');
  }

  return currentCity;
}

Future<City4H> get4HInfo(String city) async {
  City4H city4H = new City4H();
  // String city = "Lyon";
  String apikey = "6919a84b76463e69ad5a578e8af8c759";
  //https://samples.openweathermap.org/data/2.5/forecast?id=524901&appid=b1b15e88fa797225412429c1c50c122a1
  var url = Uri.parse(
      "https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$apikey&lang=fr&units=metric");
  var response = await http.get(url);

  if (response.statusCode == 200) {
    var jsonResponse = City4H.fromJson(jsonDecode(response.body));
    return jsonResponse;
  } else {
    print('Error: ${response.statusCode}.');
  }

  return city4H;
}
