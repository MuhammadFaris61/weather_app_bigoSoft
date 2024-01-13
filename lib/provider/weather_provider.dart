import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/alertDialog/alert_dialog.dart';
import 'package:weather_app/utlis/string_constants.dart';

class WeatherProvider with ChangeNotifier {
  final WeatherFactory weatherFactory = WeatherFactory(StringConstants.apiKey);

  List<Weather> _weatherList = [];

  List<Weather> get getWeatherList => _weatherList;
  String _cityName = "";
  String get getCityName=>_cityName;
  void fetchWeatherCredentials(BuildContext context,[String cityName = StringConstants.lahore]) {

    _cityName=cityName;
    weatherFactory.fiveDayForecastByCityName(cityName).then((value) {
      _weatherList = value;
      notifyListeners();
    }).onError((error, stackTrace) {
      alertDialog(() {
        Navigator.of(context).pop();
  }, StringConstants.error, StringConstants.somethingWentWrong, StringConstants.ok, context);
    });
  }
}
