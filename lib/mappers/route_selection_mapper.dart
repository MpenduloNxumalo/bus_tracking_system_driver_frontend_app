import '../blocs/route_selection/route_selection_state.dart';
import '../models/route.dart';

class RouteSelectionMapper {
  static DisplayAvailableRoutesState returnDisplayAvailableRoutesState(List<BusRoute> routes) {
    return DisplayAvailableRoutesState(routes);
  }

  static LoadingState returnLoadingState() {
    return LoadingState();
  }

  static ErrorState returnErrorState() {
    return ErrorState();
  }

  static EmptyState returnEmptyState() {
    return EmptyState();
  }

  static StartTripState returnStartTripState(BusRoute chosenRoute){
    return StartTripState(chosenRoute);
  }
}


