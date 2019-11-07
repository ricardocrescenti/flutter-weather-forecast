import 'package:flutter/material.dart';
import 'package:module_provider/module_provider.dart';
import 'package:state_persistence/state_persistence.dart';
import 'package:weather_forecast/app/api/open_weather.dart';
import 'package:weather_forecast/app/app_component.dart';
import 'package:weather_forecast/app/pages/home/home_component.dart';
import 'package:weather_forecast/app/services/app_service.dart';

class AppModule extends Module {
  @override
  List<Inject<Service>> get services => [
    Inject((m, arg) => AppService(m)),
    Inject((m, arg) => OpenWeatherApi(m)),
  ];

  @override
  List<Inject<Component<Controller>>> get components => [
    Inject((m, arg) => AppComponent()),
    Inject((m, arg) => HomeComponent()),
  ];  

  @override
  Widget build(BuildContext context) {
    return PersistedAppState(
      storage: JsonFileStorage(initialData: {
        'city_id': '',
      }),
      child: component<AppComponent>()
    );
  }
}