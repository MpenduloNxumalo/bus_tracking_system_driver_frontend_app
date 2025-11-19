import 'package:flutter/cupertino.dart';

class WidgetUtil{
  static void logWidgetCreationInfo(Widget widget, void Function(String) logger) {
    String log = "widget: ${widget.runtimeType.toString()} has been created";
    logger(log);
  }
}