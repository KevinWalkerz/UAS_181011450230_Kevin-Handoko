class WeatherInfo {

  final String icon;

  WeatherInfo({this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final icon = json['icon'];
    return WeatherInfo(icon: icon);
  }
}
/*
class CountryInfo {
  final String countryinfo;

  CountryInfo({this.countryinfo});

  factory CountryInfo.fromJson(Map<String, dynamic> json) {
    final countryinfo = json['temp'];
    return CountryInfo(countryinfo: countryinfo);
  }
}
*/
class TemperatureInfo {
  final double temperature;

  TemperatureInfo({this.temperature});

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json['temp'];
    return TemperatureInfo(temperature: temperature);
  }
}

class WeatherResponse {
  final String cityName;
  //final CountryInfo countryInfo;
  final TemperatureInfo tempInfo;
  final WeatherInfo weatherInfo;


  String get iconUrl {
    return 'https://openweathermap.org/img/wn/${weatherInfo.icon}@2x.png';
  }

  WeatherResponse({this.cityName,/*this.countyInfo,*/ this.tempInfo, this.weatherInfo});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];

    /*final countryInfoJson = json['sys'];
    final countryInfo = CountryInfo.fromJson(countryInfoJson);*/

    final tempInfoJson = json['main'];
    final tempInfo = TemperatureInfo.fromJson(tempInfoJson);

    final weatherInfoJson = json['weather'][0];
    final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);

    return WeatherResponse(
        cityName: cityName, tempInfo: tempInfo, weatherInfo: weatherInfo);
  }
}