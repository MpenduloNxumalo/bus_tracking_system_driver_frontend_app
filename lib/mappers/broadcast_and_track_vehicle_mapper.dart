import 'package:bus_tracking_system_driver_frontend_app/blocs/broadcast_trip/broadcast_and_track_vehicle_state.dart';
import 'package:bus_tracking_system_driver_frontend_app/models/route.dart';

class BroadcastAndTrackVehicleMapper {
  static BroadcastAndTrackVehicleState returnErrorState(message) {
    return ErrorState(message);
  }

  static BroadcastAndTrackVehicleState returnLoadingState() {
    return LoadingState();
  }

  static BroadcastAndTrackVehicleState returnEmptyState() {
    return EmptyState();
  }

  static BroadcastAndTrackVehicleState returnDisplayRouteAndCurrentLocationState(BusRoute route) {
    return DisplayRouteAndCurrentLocationState(route);
  }
}