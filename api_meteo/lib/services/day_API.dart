import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/city.dart';

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

Future<City> getInfoData(String city) async {
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
