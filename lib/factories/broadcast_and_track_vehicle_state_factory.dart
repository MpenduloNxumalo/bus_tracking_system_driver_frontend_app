import 'package:bus_tracking_system_driver_frontend_app/blocs/broadcast_trip/broadcast_and_track_vehicle_bloc.dart';
import 'package:bus_tracking_system_driver_frontend_app/factories/factories.dart';
import 'package:bus_tracking_system_driver_frontend_app/interfaces/app_interfaces/app_state.dart';
import 'package:bus_tracking_system_driver_frontend_app/widgets/empty_state_widget.dart';
import 'package:bus_tracking_system_driver_frontend_app/widgets/loading_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import '../blocs/broadcast_trip/broadcast_and_track_vehicle_event.dart';
import '../blocs/broadcast_trip/broadcast_and_track_vehicle_state.dart';
import '../models/route.dart';
import '../widgets/display_route_and_current_location_state_widget.dart';

class BroadcastAndTrackVehicleStateFactory extends Factory {
  final BusRoute chosenRoute;

  BroadcastAndTrackVehicleStateFactory(super.context, this.chosenRoute);

  @override
  Widget createState(AppState state, Bloc bloc) {
    final BroadcastAndTrackVehicleBloc broadcastAndTrackVehicleBloc =
        bloc as BroadcastAndTrackVehicleBloc;

    if (state is EmptyState) {
      print("empty");
      broadcastAndTrackVehicleBloc.add(LoadingStateAction());
      return const EmptyStateWidget(emptyStateMessage: '',);
    } else if (state is LoadingState) {
      print("loading");
      broadcastAndTrackVehicleBloc
          .add(DisplayRouteAndCurrentLocationStateAction(chosenRoute));
      return const LoadingStateWidget();
    } else if (state is DisplayRouteAndCurrentLocationState) {
      return DisplayRouteAndCurrentLocationStateWidget();
    } else if (state is ErrorState) {
      return Center(child: Text(state.message));
    } else {
      return const SizedBox();
    }
  }

  @override
  var logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2, // Number of method calls to be displayed
      errorMethodCount: 8, // Number of method calls if stacktrace is provided
      lineLength: 120, // Width of the output
      colors: true, // Colorful log messages
      printEmojis: true, // Print an emoji for each log message
      // Should each log print contain a timestamp
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),
  );

  @override
  errorLog(String errorMessage) {
    logger = logger as Logger;
    logger.e(errorMessage);
  }

  @override
  infoLog(String infoMessage) {
    logger = logger as Logger;
    logger.i(infoMessage);
  }

  @override
  warnLog(String warningMessage) {
    logger = logger as Logger;
    logger.w(warningMessage);
  }
}


