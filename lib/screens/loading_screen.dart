import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_clima/engine/location.dart';
import 'package:my_clima/engine/network.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:my_clima/screens/location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkDrive _networkDrive = NetworkDrive(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.lat}&lon=${location.lon}&appid=a4082235f87c2cffed8d9b7287cbb4f3');
    print('weather');
    var weather = await _networkDrive.networkHelper();
    print('weather2');
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        weatherRecieved: weather,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitSquareCircle(
            color: Colors.white,
            size: 50.0,
          ),
          SizedBox(
            height: 50.0,
          ),
          Text("Getting Location and Weather Data...")
        ],
      ),
    );
  }
}
