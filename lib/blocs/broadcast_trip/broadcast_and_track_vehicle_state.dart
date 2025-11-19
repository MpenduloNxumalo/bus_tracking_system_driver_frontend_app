import 'package:bus_tracking_system_driver_frontend_app/models/route.dart';

import '../../interfaces/app_interfaces/app_state.dart';

abstract class BroadcastAndTrackVehicleState implements AppState {}

class EmptyState extends BroadcastAndTrackVehicleState {}

class LoadingState extends BroadcastAndTrackVehicleState {}

class DisplayRouteAndCurrentLocationState extends BroadcastAndTrackVehicleState {
  BusRoute route;
  DisplayRouteAndCurrentLocationState(this.route);
}

class ErrorState extends BroadcastAndTrackVehicleState {
  String message = "";
  ErrorState(this.message);
}
