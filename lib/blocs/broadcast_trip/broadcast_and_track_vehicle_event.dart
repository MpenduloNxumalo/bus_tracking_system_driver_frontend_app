import 'package:bus_tracking_system_driver_frontend_app/models/route.dart';

import '../../interfaces/app_interfaces/app_event.dart';

abstract class BroadcastAndTrackVehicleEvent implements AppEvent {}

class LoadingStateAction extends BroadcastAndTrackVehicleEvent{}
class EmptyStateAction extends BroadcastAndTrackVehicleEvent{}
class ErrorStateAction extends BroadcastAndTrackVehicleEvent{
  String message;
  ErrorStateAction(this.message);
}
class DisplayRouteAndCurrentLocationStateAction extends BroadcastAndTrackVehicleEvent{
  BusRoute route;
  DisplayRouteAndCurrentLocationStateAction(this.route);
}