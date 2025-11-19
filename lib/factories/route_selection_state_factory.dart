import 'package:bus_tracking_system_driver_frontend_app/blocs/route_selection/route_selection_event.dart';
import 'package:bus_tracking_system_driver_frontend_app/factories/factories.dart';
import 'package:bus_tracking_system_driver_frontend_app/interfaces/app_interfaces/app_state.dart';
import 'package:bus_tracking_system_driver_frontend_app/widgets/display_available_routes_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:logger/src/logger.dart';

import '../blocs/route_selection/route_selection_bloc.dart';
import '../blocs/route_selection/route_selection_state.dart';
import '../views/broadcast_and_track_vehicle_view.dart';
import '../widgets/error_state_widget.dart';
import '../widgets/loading_state_widget.dart';

class RouteSelectionStateFactory extends Factory {
  RouteSelectionStateFactory(super.context);

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
  Widget createState(AppState state, Bloc bloc) {
    final RouteSelectionBloc routeSelectionBloc = bloc as RouteSelectionBloc;
    if (state is DisplayAvailableRoutesState) {
      Widget widget = DisplayAvailableRoutesWidget(bloc: routeSelectionBloc, state: state);
      return widget;
    } else if (state is EmptyState) {
      bloc.add(LoadingStateAction());
      return const LoadingStateWidget();
    } else if (state is LoadingState) {
      bloc.add(DisplayAvailableRoutesAction());
      return const LoadingStateWidget();
    } else if (state is ErrorState) {
      return const ErrorStateWidget(
        errorMessage: "This is the error state",
      );
    } else if (state is StartTripState) {
      print(state.chosenRoute);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PopScope(
              canPop: true,
              onPopInvoked: (didPop) {
                print("Back pressed!");
                routeSelectionBloc.add(EmptyStateAction());
              },
              child: BroadcastAndTrackVehicleView(
                chosenRoute: state.chosenRoute,
              ),
            ),
          ),
        );
      });
      return const LoadingStateWidget();
    } else {
      return const Column();
    }
  }


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
