import 'package:flutter/material.dart';
import 'package:module_provider/module_provider.dart';
import 'package:state_persistence/state_persistence.dart';
import 'package:weather_forecast/app/api/open_weather.dart';
import 'package:weather_forecast/app/models/city_model.dart';

class AppService extends Service {
  bool _darkMode = false;
  bool get darkMode => _darkMode;

  Future<CityModel> currentCity;

  AppService(Module module) : super(module);

  changeDarkMode() {
    _darkMode = !darkMode;
    notifyListeners();
  }

  updateCurrentCity(BuildContext context, int id) {
    currentCity = module.service<OpenWeatherApi>().getCityWeatherForecast(id);
    
    final data = PersistedAppState.of(context);
    if (data['city_id'] != id) {
      PersistedAppState.of(context).update('city_id', (key) => id);
    }
  }

  retryCurrentCity(BuildContext context) {
    final data = PersistedAppState.of(context);
    currentCity = module.service<OpenWeatherApi>().getCityWeatherForecast(data['city_id']);
    return currentCity;
  }
}