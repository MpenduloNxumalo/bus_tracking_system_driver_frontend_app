import 'package:bus_tracking_system_driver_frontend_app/factories/factories.dart';
import 'package:bus_tracking_system_driver_frontend_app/models/route.dart';
import 'package:bus_tracking_system_driver_frontend_app/views/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/broadcast_trip/broadcast_and_track_vehicle_bloc.dart';
import '../blocs/broadcast_trip/broadcast_and_track_vehicle_state.dart';
import '../factories/broadcast_and_track_vehicle_state_factory.dart';

class BroadcastAndTrackVehicleView extends StatefulWidget {
  final BusRoute chosenRoute;
  const BroadcastAndTrackVehicleView({required this.chosenRoute,super.key});

  @override
  State<BroadcastAndTrackVehicleView> createState() => _BroadcastAndTrackVehicleViewState();
}

class _BroadcastAndTrackVehicleViewState extends State<BroadcastAndTrackVehicleView> implements AppView {
  @override
  Widget build(BuildContext context) {
    BroadcastAndTrackVehicleStateFactory factory = BroadcastAndTrackVehicleStateFactory(context,widget.chosenRoute);
    return render(factory);
  }

  @override
  Widget render(Factory factory) {
    return SafeArea(
      top: false,
      child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocBuilder<BroadcastAndTrackVehicleBloc, BroadcastAndTrackVehicleState>(
              builder: (context, state) {
                final broadcastAndTrackVehicleBloc = context.read<BroadcastAndTrackVehicleBloc>();
                return factory.renderState(state, broadcastAndTrackVehicleBloc);
              },
            ),
          )),
    );
  }
}





