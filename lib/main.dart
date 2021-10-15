import 'package:flutter/material.dart';
import 'package:weatherapps/services/weather_service.dart';
import 'package:weatherapps/models/weather_models.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();

  WeatherResponse _response;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('181011450230 - Kevin Handoko'),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    controller: _cityTextController,
                    decoration: InputDecoration(
                      hintText: "Masukkan Nama Kota",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(onPressed: _search, child: Text('Search')),
                Container(
                  child: const SizedBox(height: 80),
                ),
                if (_response != null)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${_response.cityName}',style: TextStyle(fontSize: 40),
                      ),
                      Image.network(_response.iconUrl),
                      Text(
                        '${_response.tempInfo.temperature}',
                        style: TextStyle(fontSize: 70),
                      ),
                      Text('°Celsius', style: TextStyle(fontSize: 30))
                    ],
                  ),

              ],
            ),
          ),
        ));
  }

  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    setState(() => _response = response);
  }
}