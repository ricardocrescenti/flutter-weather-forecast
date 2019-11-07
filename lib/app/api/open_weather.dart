import 'package:dio/dio.dart';
import 'package:module_provider/module_provider.dart';
import 'package:weather_forecast/app/models/city_model.dart';

class OpenWeatherApi extends Service {
  Dio dio = Dio();
  String apiKey = 'dd4cc01a0db311945082666086a22993';

  OpenWeatherApi(Module module) : super(module);

  Future<List<CityModel>> searchCities(String cityName) async {
    Response response = await dio.get('https://openweathermap.org/data/2.5/find', queryParameters: {
      'q': cityName,
      'appid': 'b6907d289e10d714a6e88b30761fae22',
      'lang': 'en'
    });

    List list = response.data['list'];
    return list.map<CityModel>((item) => CityModel.fromJson(item)).toList();
  }

  Future<CityModel> getCityWeatherForecast(int id) async {
    Response response = await dio.get('http://api.openweathermap.org/data/2.5/weather', queryParameters: {
      'id': id,
      'appid': apiKey,
      'lang': 'en'
    });

    return CityModel.fromJson(response.data);
  }
}