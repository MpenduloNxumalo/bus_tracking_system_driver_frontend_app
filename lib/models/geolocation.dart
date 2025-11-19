import 'dart:core';

class Geolocation {
  late double _latitude;
  late double _longitude;

  Geolocation(this._latitude, this._longitude);

  @override
  String toString() {
    return 'Geolocation{latitude: $_latitude, longitude: $_longitude}';
  }

  double get longitude => _longitude;

  double get latitude => _latitude;
}