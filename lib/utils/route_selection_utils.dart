import 'package:bus_tracking_system_driver_frontend_app/models/route.dart';

class RouteSelectionUtils{
  static String generateText(List<BusRoute> routes) {
    if (routes.isNotEmpty) {
      return "Select route being taken...";
    } else {
      return "Selections are empty";
    }
  }

}