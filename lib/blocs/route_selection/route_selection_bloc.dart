import 'package:bus_tracking_system_driver_frontend_app/blocs/route_selection/route_selection_event.dart';
import 'package:bus_tracking_system_driver_frontend_app/blocs/route_selection/route_selection_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../mappers/route_selection_mapper.dart';
import '../../models/route.dart';
import '../../services/route_selection_service.dart';

class RouteSelectionBloc
    extends Bloc<RouteSelectionEvent, RouteSelectionState> {
  RouteSelectionService service = RouteSelectionService();

  RouteSelectionBloc() : super(EmptyState()) {
    on<EmptyStateAction>((event, emit) {
      emit(RouteSelectionMapper.returnEmptyState());
    });
    on<LoadingStateAction>((event, emit) {
      emit(RouteSelectionMapper.returnLoadingState());
    });
    on<DisplayAvailableRoutesAction>((event, emit) {
      emit(RouteSelectionMapper.returnDisplayAvailableRoutesState(
          service.getAvailableRoutes()));
    });
    on<ErrorStateAction>((event, emit) {
      emit(RouteSelectionMapper.returnErrorState());
    });
    on<ClickSelectRouteButtonAction>((event, emit) {
      BusRoute chosenRoute = event.chosenRoute;
      emit(RouteSelectionMapper.returnStartTripState(chosenRoute));
    });
  }
}
