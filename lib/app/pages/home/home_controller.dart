import 'package:flutter/material.dart';
import 'package:module_provider/module_provider.dart';
import 'package:state_persistence/state_persistence.dart';
import 'package:weather_forecast/app/searches/city_search_widget.dart';
import 'package:weather_forecast/app/services/app_service.dart';

class HomeController extends Controller {
  HomeController(Module module) : super(module);

  loadCurrentCity(BuildContext context) {
    final data = PersistedAppState.of(context);
    if (data != null && data['city_id'].toString().isNotEmpty) {
      module.service<AppService>().updateCurrentCity(context, int.tryParse(data['city_id'].toString()));
    }
  }

  search(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => CitySearchWidget()
    ));
  }
}