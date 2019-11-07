import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weather_forecast/app/models/city_model.dart';
import 'package:intl/intl.dart';

class WeatherCityWidget extends StatelessWidget {
  final CityModel city;

  WeatherCityWidget(this.city);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(30),
      children: <Widget>[
        buildLocation(context),
        padding(),
        buildForecast(context),
        buildTemperature(context),
        buildTable(context),
      ],
    );
  }

  buildLocation(BuildContext context) {
    return Text('Weather in ${city.name}, ${city.sys.country}', style: Theme.of(context).textTheme.body1.copyWith(fontSize: 20), textAlign: TextAlign.center,);
  }

  buildForecast(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        //Text(DateFormat('yyyy-MM-dd HH:mm').format(DateTime.fromMillisecondsSinceEpoch(city.dt * 1000))),
        //padding(),
        Text(city.weather[0].description, style: Theme.of(context).textTheme.subhead,),
      ],
    );
  }

  buildTemperature(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CachedNetworkImage(
          imageUrl: 'https://openweathermap.org/img/wn/${city.weather[0].icon}@2x.png',
          height: 100,
          width: 100,
        ),
        Text('${getTemperature(city.main.temp)}°С', style: Theme.of(context).textTheme.body1.copyWith(fontSize: 35, fontWeight: FontWeight.bold),)
      ],
    );
  }

  buildTable(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 370),
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: {
          0: FlexColumnWidth(1),
          1: FlexColumnWidth(2.5)
        },
        children: [
          buildTableRow(context, 'Wind', '${city.wind.speed} m/s, North-northwest ( ${city.wind.deg} )'),
          buildTableRow(context, 'Pressure', '${city.main.pressure} hpa'),
          buildTableRow(context, 'Humidity', '${city.main.humidity} %'),
          //buildTableRow(context, 'Rain', '${city.rain?.d3h} mm'),
          buildTableRow(context, 'Sunrise', '${DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(city.sys.sunrise * 1000))}'),
          buildTableRow(context, 'Sunset', '${DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(city.sys.sunset * 1000))}'),
          buildTableRow(context, 'Geo coords', '[${city.coord.lat}, ${city.coord.lon}]'),
        ],
      ),
    );
  }

  buildTableRow(BuildContext context, String title, String value) {
    TextStyle textStyle = Theme.of(context).textTheme.body1.copyWith(fontSize: 14);
    return TableRow(children: [
      Padding(
        padding: EdgeInsets.symmetric( vertical: 5, horizontal: 10),
        child: Text(title, style: textStyle.copyWith(fontWeight: FontWeight.bold),),
      ),
      Padding(
        padding: EdgeInsets.symmetric( vertical: 5, horizontal: 10),
        child: Text(value, style: textStyle,),
      )
    ]);
  }

  padding({double padding = 10}) {
    return Padding(padding: EdgeInsets.only(top: padding, right: padding),);
  }

  getTemperature(double kelvinTemperature) {
    return (kelvinTemperature - 273.15).toStringAsFixed(2);
  }
}