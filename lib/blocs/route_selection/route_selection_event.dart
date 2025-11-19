import '../../interfaces/app_interfaces/app_event.dart';
import '../../models/route.dart';

abstract class RouteSelectionEvent implements AppEvent {}

class ClickSelectRouteButtonAction extends RouteSelectionEvent {
  BusRoute chosenRoute;
  ClickSelectRouteButtonAction(this.chosenRoute);
}

class LoadingStateAction extends RouteSelectionEvent {}

class ErrorStateAction extends RouteSelectionEvent {}

class  EmptyStateAction extends RouteSelectionEvent {}

class  DisplayAvailableRoutesAction extends RouteSelectionEvent {}
