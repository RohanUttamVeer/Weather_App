import 'package:path/path.dart' as Path;
import 'package:weather_app/screens/location_screen.dart';
import 'package:weather_app/services/location.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = '546f892f6984d3c99c996a504172f711';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  // final spinkit = SpinKitWave(
  //   itemBuilder: (BuildContext context, int index) {
  //     return DecoratedBox(
  //       decoration: BoxDecoration(
  //         color: index.isEven ? Colors.white : Colors.green,
  //       ),
  //     );
  //   },
  // );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SpinKitWave(
      color: Colors.white,
      size: 50,
    )));
  }
}
