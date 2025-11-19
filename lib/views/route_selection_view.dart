import 'package:bus_tracking_system_driver_frontend_app/factories/route_selection_state_factory.dart';
import 'package:bus_tracking_system_driver_frontend_app/factories/factories.dart';
import 'package:bus_tracking_system_driver_frontend_app/views/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/route_selection/route_selection_bloc.dart';
import '../blocs/route_selection/route_selection_state.dart';

class RouteSelectionView extends StatefulWidget {
  const RouteSelectionView({super.key});

  @override
  State<RouteSelectionView> createState() => _RouteSelectionViewState();
}

class _RouteSelectionViewState extends State<RouteSelectionView> implements AppView{

  @override
  Widget build(BuildContext context) {
    RouteSelectionStateFactory factory = RouteSelectionStateFactory(context);
    return render(factory);
  }

  @override
  Widget render(Factory factory) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocBuilder<RouteSelectionBloc, RouteSelectionState>(
              builder: (context, state) {
                final routeSelectionBloc = context.read<RouteSelectionBloc>();
                return factory.renderState(state, routeSelectionBloc);
              },
            ),
          ),
        ));
  }
}
