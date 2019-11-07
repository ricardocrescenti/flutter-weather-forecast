import 'package:flutter/material.dart';
import 'package:module_provider/module_provider.dart';
import 'package:useful_widgets/useful_widgets.dart';
import 'package:weather_forecast/app/api/open_weather.dart';
import 'package:weather_forecast/app/app_module.dart';
import 'package:weather_forecast/app/models/city_model.dart';
import 'package:weather_forecast/app/services/app_service.dart';

class CitySearchWidget extends SearchWidget<List<CityModel>> {
  CitySearchWidget();

  @override
  Widget buildResult(BuildContext context, List<CityModel> result) {
    return ListView.separated(
      itemCount: result.length,
      itemBuilder: (context, index) => buildItem(context, result[index]),
      separatorBuilder: (context, index) => Divider(),
    );
  }

  @override
  bool canSearch(BuildContext context, String query) {
    return query.length > 3;
  }

  @override
  Future<List<CityModel>> search(String query) {
    return Module.of<AppModule>().service<OpenWeatherApi>().searchCities(query);
  }

  buildItem(BuildContext context, CityModel city) {
    return ListTile(
      leading: Image.network('http://openweathermap.org/img/wn/${city.weather[0].icon}@2x.png'),
      title: buildItemTitle(city),
      subtitle: buildItemSubTitle(city),
      onTap: () {
        Module.of<AppModule>().service<AppService>().updateCurrentCity(context, city.id);
        close(context);
      },
    );
  }

  buildItemTitle(CityModel city) {
    return Row(
      children: <Widget>[
        Image.network('http://openweathermap.org/images/flags/${city.sys.country.toLowerCase()}.png'),
        Padding(padding: EdgeInsets.all(2),),
        Text(city.name),
        Padding(padding: EdgeInsets.all(2),),
      ],
    );
  }
  buildItemSubTitle(CityModel city) {
    return Text('${getTemperature(city.main.temp)}°С temperature from ${getTemperature(city.main.tempMin)} to ${getTemperature(city.main.tempMax)} °С, wind ${city.wind.speed} m/s. clouds ${city.clouds.all} %, ${city.main.pressure} hpa', softWrap: false, overflow: TextOverflow.fade,);
  }

  getTemperature(double kelvinTemperature) {
    return (kelvinTemperature - 273.15).toStringAsFixed(2);
  }
}