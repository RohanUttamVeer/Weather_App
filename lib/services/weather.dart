import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';

const apiKey = '546f892f6984d3c99c996a504172f711';
const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$openWeatherMapUrl?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String? getWeatherCondition(int condition) {
    if (condition < 300)
      return '๐ฉ๏ธ';
    else if (condition < 400)
      return '๐ง๏ธ';
    else if (condition < 600)
      return 'โ';
    else if (condition < 700)
      return 'โ๏ธ';
    else if (condition < 800)
      return '๐ช๏ธ';
    else if (condition == 800)
      return 'โ๏ธ';
    else if (condition <= 804)
      return 'โ๏ธ';
    else
      return '๐ฎ';
  }

  String? getMessage(int temp) {
    if (temp > 40)
      return 'it\'s ๐ฆ time';
    else if (temp > 30)
      return ' time for shorts and ๐ฝ';
    else if (temp < 20)
      return ' you\'ll need a ๐งฅ and ๐งค';
    else
      return 'take a ๐ just in case';
  }
}
