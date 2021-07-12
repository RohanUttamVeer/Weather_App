class WeatherModel {
  String? getWeatherCondition(int condition) {
    if (condition < 300)
      return '🌩️';
    else if (condition < 400)
      return '🌧️';
    else if (condition < 600)
      return '☔';
    else if (condition < 700)
      return '❄️';
    else if (condition < 800)
      return '🌪️';
    else if (condition == 800)
      return '☀️';
    else if (condition <= 804)
      return '☁️';
    else
      return '🔮';
  }

  String? getMessage(int temp) {
    if (temp > 30)
      return 'it\'s 🍦 time';
    else if (temp > 20)
      return ' time for shorts 🩳 and 🎽';
    else if (temp < 20)
      return ' you\'ll need a 🧥 and 🧤';
    else
      return 'take a 🌂 just in case';
  }
}
