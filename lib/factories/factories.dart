import 'package:bus_tracking_system_driver_frontend_app/interfaces/app_interfaces/app_logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../interfaces/app_interfaces/app_state.dart';

abstract class Factory implements AppLogger{
  BuildContext context;
  Factory(this.context);

  Widget renderState(AppState state, Bloc bloc,){
    reportStateRender(state);
    return createState(state, bloc);
  }
  Widget createState(AppState state, Bloc bloc);

  reportStateRender(AppState state){
    String message = "state: ${state.runtimeType.toString()} is being rendered";
    infoLog(message);
  }

}