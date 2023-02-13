import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkDrive {
  var url;

  NetworkDrive(this.url);

  Future networkHelper() async {
    http.Response response = await http.get(Uri.parse(url));
    String bodyData = response.body;
    var weatherId = jsonDecode(bodyData)["weather"][0]["id"];
    var weatherTemp = jsonDecode(bodyData)["main"]["temp"];
    var weatherCity = jsonDecode(bodyData)["name"];
    var weatherList = [weatherId, weatherTemp, weatherCity];
    return weatherList;
  }
}

// https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
// a4082235f87c2cffed8d9b7287cbb4f3
