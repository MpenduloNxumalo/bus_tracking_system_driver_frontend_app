import 'package:bus_tracking_system_driver_frontend_app/interfaces/app_interfaces/app_logger.dart';
import 'package:bus_tracking_system_driver_frontend_app/widgets/app_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../utils/widget_utils.dart';

class LoadingStateWidget extends AppWidget {
  const LoadingStateWidget({super.key});

  @override
  State<LoadingStateWidget> createState() => _LoadingStateWidgetState();
}

class _LoadingStateWidgetState extends State<LoadingStateWidget> implements AppLogger {
  @override
  Widget build(BuildContext context) {
    WidgetUtil.logWidgetCreationInfo(widget,infoLog);
    return const Center(child: CircularProgressIndicator(),);
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
    logger.e(errorMessage);
  }

  @override
  infoLog(String infoMessage) {
    logger.i(infoMessage);
  }

  @override
  warnLog(String warningMessage) {
    logger.w(warningMessage);
  }
}


