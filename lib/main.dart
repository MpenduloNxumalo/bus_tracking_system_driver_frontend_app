import 'package:bus_tracking_system_driver_frontend_app/blocs/broadcast_trip/broadcast_and_track_vehicle_bloc.dart';
import 'package:bus_tracking_system_driver_frontend_app/views/route_selection_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

import 'blocs/route_selection/route_selection_bloc.dart';

void main() async {
  await setup();
  runApp(const MyApp());
}

Future<void> setup() async{
  await dotenv.load(
    fileName: ".env"
  );
  MapboxOptions.setAccessToken(dotenv.env["MAPBOX_ACCESS_TOKEN"]!,);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => RouteSelectionBloc()),
          BlocProvider(create: (context) => BroadcastAndTrackVehicleBloc())
        ],
        child: const MaterialApp(
          title: "Bus Tracking System",
          home: RouteSelectionView(),
        )
    );
  }
}
