import '../../interfaces/app_interfaces/app_state.dart';
import '../../models/route.dart';

sealed class RouteSelectionState implements AppState {}

class DisplayAvailableRoutesState extends RouteSelectionState {
  final List<BusRoute> routes;
  DisplayAvailableRoutesState(this.routes);
}

class EmptyState extends RouteSelectionState {}

class LoadingState extends RouteSelectionState {}

class ErrorState extends RouteSelectionState {}

class StartTripState extends RouteSelectionState{
  final BusRoute chosenRoute;
  StartTripState(this.chosenRoute);
}


