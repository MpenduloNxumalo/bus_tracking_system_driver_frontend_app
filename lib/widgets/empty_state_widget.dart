import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

import '../interfaces/app_interfaces/app_logger.dart';
import '../utils/widget_utils.dart';
import 'app_widget.dart';

class EmptyStateWidget extends AppWidget{
  final String emptyStateMessage;

  const EmptyStateWidget({super.key, required this.emptyStateMessage});

  @override
  State<EmptyStateWidget> createState() => EmptyStateViewState();
}

class EmptyStateViewState extends State<EmptyStateWidget> implements AppLogger {
  @override
  Widget build(BuildContext context) {
    WidgetUtil.logWidgetCreationInfo(widget,logger.i);
    return Center(
      child: Text(widget.emptyStateMessage),
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