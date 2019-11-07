import 'package:flutter/material.dart';
import 'package:module_provider/module_provider.dart';
import 'package:useful_widgets/useful_widgets.dart';
import 'package:weather_forecast/app/models/city_model.dart';
import 'package:weather_forecast/app/pages/home/home_controller.dart';
import 'package:weather_forecast/app/services/app_service.dart';
import 'package:weather_forecast/app/widgets/no_city_loaded/no_city_loaded_widget.dart';
import 'package:weather_forecast/app/widgets/weather_city/weather_city_widget.dart';

class HomeComponent extends Component<HomeController> {
  @override
  initController(BuildContext context, Module module) => HomeController(module);

  @override
  initialize(BuildContext context, Module module, HomeController controller) {
    controller.loadCurrentCity(context);
  }

  @override
  Widget build(BuildContext context, Module module, HomeController controller) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Forecast'),
        centerTitle: true,
      ),
      body: _buildBody(context, module),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () => controller.search(context),
      ),
    );
  }

  _buildBody(BuildContext context, Module module) {
    final appService = module.service<AppService>();
    
    if (appService.currentCity != null) {
      return RefreshWidget(
        future: (context) => module.service<AppService>().retryCurrentCity(context),
        builder: (context) {
          return FutureWidget<CityModel>(
            future: (context) => appService.currentCity,
            retry: (context) => appService.retryCurrentCity(context),
            builder: (context, result) => WeatherCityWidget(result),
          );
        }
      );
    } else {
      return NoCityLoadedComponent();
    }
  }
}