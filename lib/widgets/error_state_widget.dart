import 'package:bus_tracking_system_driver_frontend_app/interfaces/app_interfaces/app_logger.dart';
import 'package:bus_tracking_system_driver_frontend_app/widgets/app_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

import '../utils/widget_utils.dart';

class ErrorStateWidget extends AppWidget {
  final String errorMessage;

  const ErrorStateWidget({required this.errorMessage, super.key});

  @override
  State<ErrorStateWidget> createState() => _ErrorStateWidgetState();
}

class _ErrorStateWidgetState extends State<ErrorStateWidget> implements AppLogger {
  @override
  Widget build(BuildContext context) {
    WidgetUtil.logWidgetCreationInfo(widget,infoLog);
    return Column(
      children: [
        Text(widget.errorMessage)
      ],
    );
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