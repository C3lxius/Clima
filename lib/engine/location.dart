import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  double lat;
  double lon;

  getCurrentLocation() async {
    try {
      await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      lat = position.latitude;
      lon = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
