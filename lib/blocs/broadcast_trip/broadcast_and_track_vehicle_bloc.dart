import 'package:bus_tracking_system_driver_frontend_app/blocs/broadcast_trip/broadcast_and_track_vehicle_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../mappers/broadcast_and_track_vehicle_mapper.dart';
import 'broadcast_and_track_vehicle_event.dart';

class BroadcastAndTrackVehicleBloc
    extends Bloc<BroadcastAndTrackVehicleEvent, BroadcastAndTrackVehicleState> {
  BroadcastAndTrackVehicleBloc() : super(EmptyState()) {
    on<LoadingStateAction>((event, emit) {
      emit(BroadcastAndTrackVehicleMapper.returnLoadingState());
    });
    on<ErrorStateAction>((event, emit) {
      emit(BroadcastAndTrackVehicleMapper.returnErrorState(event.message));
    });
    on<EmptyStateAction>((event, emit) {
      emit(BroadcastAndTrackVehicleMapper.returnEmptyState());
    });
    on<DisplayRouteAndCurrentLocationStateAction>((event, emit) {
      emit(BroadcastAndTrackVehicleMapper.returnDisplayRouteAndCurrentLocationState(event.route));
    });
  }
}
