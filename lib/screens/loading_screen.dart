import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weather_app/services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {
    http.Response response = await http.get(
        'http://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=546f892f6984d3c99c996a504172f711');

    if (response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);

      int condition = decodedData['weather'][0]['id'];
      double temperature = decodedData['main']['temp'];
      String city = decodedData['name'];

      print(condition);
      print(temperature);
      print(city);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
