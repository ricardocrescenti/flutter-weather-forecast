class CityModel {
  Clouds clouds;
  Coord coord;
  int dt;
  int id;
  Main main;
  String name;
  Rain rain;
  Null snow;
  Sys sys;
  List<Weather> weather;
  Wind wind;

  CityModel(
      {this.clouds,
      this.coord,
      this.dt,
      this.id,
      this.main,
      this.name,
      this.rain,
      this.snow,
      this.sys,
      this.weather,
      this.wind});

  CityModel.fromJson(Map<String, dynamic> json) {
    clouds =
        json['clouds'] != null ? new Clouds.fromJson(json['clouds']) : null;
    coord = json['coord'] != null ? new Coord.fromJson(json['coord']) : null;
    dt = json['dt'];
    id = json['id'];
    main = json['main'] != null ? new Main.fromJson(json['main']) : null;
    name = json['name'];
    rain = json['rain'] != null ? new Rain.fromJson(json['rain']) : null;
    snow = json['snow'];
    sys = json['sys'] != null ? new Sys.fromJson(json['sys']) : null;
    if (json['weather'] != null) {
      weather = new List<Weather>();
      json['weather'].forEach((v) {
        weather.add(new Weather.fromJson(v));
      });
    }
    wind = json['wind'] != null ? new Wind.fromJson(json['wind']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.clouds != null) {
      data['clouds'] = this.clouds.toJson();
    }
    if (this.coord != null) {
      data['coord'] = this.coord.toJson();
    }
    data['dt'] = this.dt;
    data['id'] = this.id;
    if (this.main != null) {
      data['main'] = this.main.toJson();
    }
    data['name'] = this.name;
    if (this.rain != null) {
      data['rain'] = this.rain.toJson();
    }
    data['snow'] = this.snow;
    if (this.sys != null) {
      data['sys'] = this.sys.toJson();
    }
    if (this.weather != null) {
      data['weather'] = this.weather.map((v) => v.toJson()).toList();
    }
    if (this.wind != null) {
      data['wind'] = this.wind.toJson();
    }
    return data;
  }
}

class Clouds {
  int all;

  Clouds({this.all});

  Clouds.fromJson(Map<String, dynamic> json) {
    all = int.tryParse(json['all'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['all'] = this.all;
    return data;
  }
}

class Coord {
  double lat;
  double lon;

  Coord({this.lat, this.lon});

  Coord.fromJson(Map<String, dynamic> json) {
    lat = double.tryParse(json['lat'].toString());
    lon = double.tryParse(json['lon'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    return data;
  }
}

class Main {
  double humidity;
  double pressure;
  double temp;
  double tempMax;
  double tempMin;

  Main({this.humidity, this.pressure, this.temp, this.tempMax, this.tempMin});

  Main.fromJson(Map<String, dynamic> json) {
    humidity = double.tryParse(json['humidity'].toString());
    pressure = double.tryParse(json['pressure'].toString());
    temp = double.tryParse(json['temp'].toString());
    tempMax = double.tryParse(json['temp_max'].toString());
    tempMin = double.tryParse(json['temp_min'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['humidity'] = this.humidity;
    data['pressure'] = this.pressure;
    data['temp'] = this.temp;
    data['temp_max'] = this.tempMax;
    data['temp_min'] = this.tempMin;
    return data;
  }
}

class Rain {
  double d3h;

  Rain({this.d3h});

  Rain.fromJson(Map<String, dynamic> json) {
    d3h = double.tryParse(json['3h'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['3h'] = this.d3h;
    return data;
  }
}

class Sys {
  String country;
  int sunrise;
  int sunset;

  Sys({this.country});

  Sys.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    sunrise = int.tryParse(json['sunrise'].toString());
    sunset = int.tryParse(json['sunset'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    return data;
  }
}

class Weather {
  String description;
  String icon;
  int id;
  String main;

  Weather({this.description, this.icon, this.id, this.main});

  Weather.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    icon = json['icon'];
    id = int.tryParse(json['id'].toString());
    main = json['main'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['icon'] = this.icon;
    data['id'] = this.id;
    data['main'] = this.main;
    return data;
  }
}

class Wind {
  double deg;
  double speed;

  Wind({this.deg, this.speed});

  Wind.fromJson(Map<String, dynamic> json) {
    deg = double.tryParse(json['deg'].toString());
    speed = double.tryParse(json['speed'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deg'] = this.deg;
    data['speed'] = this.speed;
    return data;
  }
}
