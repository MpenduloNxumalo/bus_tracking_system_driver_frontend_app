import 'dart:math';

import 'package:bus_tracking_system_driver_frontend_app/models/geolocation.dart';

import '../models/route.dart';

class RouteSelectionService {
  List<BusRoute> getAvailableRoutes() {
    List<BusRoute> routes = [
      BusRoute("1", "A", [
        Geolocation(
            generateRandomGeoCoordinate(), generateRandomGeoCoordinate()),
        Geolocation(
            generateRandomGeoCoordinate(), generateRandomGeoCoordinate()),
        Geolocation(
            generateRandomGeoCoordinate(), generateRandomGeoCoordinate()),
        Geolocation(
            generateRandomGeoCoordinate(), generateRandomGeoCoordinate()),
        Geolocation(
            generateRandomGeoCoordinate(), generateRandomGeoCoordinate()),
      ]),
      BusRoute("2", "B", [
        Geolocation(
            generateRandomGeoCoordinate(), generateRandomGeoCoordinate()),
        Geolocation(
            generateRandomGeoCoordinate(), generateRandomGeoCoordinate()),
        Geolocation(
            generateRandomGeoCoordinate(), generateRandomGeoCoordinate()),
        Geolocation(
            generateRandomGeoCoordinate(), generateRandomGeoCoordinate()),
        Geolocation(
            generateRandomGeoCoordinate(), generateRandomGeoCoordinate()),
      ])
    ];

    return routes;
  }

  double generateRandomGeoCoordinate() {
    final Random random = Random();
    double minValue = -90.0;
    double range = 180.0;
    return random.nextDouble() * range + minValue;
  }
}
