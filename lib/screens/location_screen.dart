import 'package:flutter/material.dart';
import 'package:my_clima/utilities/constants.dart';
import 'package:my_clima/engine/weather.dart';

class LocationScreen extends StatefulWidget {
  final weatherRecieved;
  LocationScreen({this.weatherRecieved});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int weatherId;
  int weatherTemp;
  String weatherCity;

  @override
  void initState() {
    super.initState();
    weatherList(widget.weatherRecieved);
  }

  // void decodeData(var weatherData) {
  //   weatherId = weatherData[0]["id"];
  //   double temp = weatherData["main"]["temp"];
  //   weatherTemp = temp.toInt();
  //   weatherCity = weatherData["name"];
  // }
  void weatherList(List weatherData) {
    weatherId = weatherData[0];
    double temp = weatherData[1];
    weatherTemp = temp.toInt();
    weatherCity = weatherData[2];
  }

  WeatherModel _weatherModel = WeatherModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '${weatherTemp - 273}°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '${_weatherModel.getWeatherIcon(weatherId)}️',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "${_weatherModel.getMessage(weatherTemp)} in $weatherCity",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
