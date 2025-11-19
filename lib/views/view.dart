import 'package:bus_tracking_system_driver_frontend_app/factories/factories.dart';
import 'package:flutter/cupertino.dart';

interface class AppView {
  Widget render(Factory factory) {
    Widget widget = const Column();
    return widget;
  }
}
