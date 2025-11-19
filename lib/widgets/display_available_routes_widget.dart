import 'package:bus_tracking_system_driver_frontend_app/blocs/route_selection/route_selection_bloc.dart';
import 'package:bus_tracking_system_driver_frontend_app/blocs/route_selection/route_selection_state.dart';
import 'package:bus_tracking_system_driver_frontend_app/interfaces/app_interfaces/app_logger.dart';
import 'package:bus_tracking_system_driver_frontend_app/models/route.dart';
import 'package:bus_tracking_system_driver_frontend_app/utils/widget_utils.dart';
import 'package:bus_tracking_system_driver_frontend_app/widgets/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logger/logger.dart';

import '../blocs/route_selection/route_selection_event.dart';
import '../resources/theme.dart';
import '../utils/route_selection_utils.dart';

class DisplayAvailableRoutesWidget extends AppWidget {
  final DisplayAvailableRoutesState state;
  final RouteSelectionBloc bloc;

  const DisplayAvailableRoutesWidget(
      {required this.state, required this.bloc, super.key});

  @override
  State<DisplayAvailableRoutesWidget> createState() =>
      DisplayAvailableRoutesViewState();
}

class DisplayAvailableRoutesViewState extends State<DisplayAvailableRoutesWidget> implements AppLogger{
  static String? selectedValue;
  static BusRoute chosenRoute = BusRoute("", "", List.empty());

  @override
  Widget build(BuildContext context) {
    WidgetUtil.logWidgetCreationInfo(widget,logger.i);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            SvgPicture.asset(
              "assets/images/wits_logo.svg", // tint color
              width: 109,
              height: 100,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 160),
            DropdownButtonFormField<String>(
              focusColor: primaryColor,
              disabledHint: hintText(
                  RouteSelectionUtils.generateText(widget.state.routes)),
              hint: hintText(
                  RouteSelectionUtils.generateText(widget.state.routes)),
              decoration: InputDecoration(
                iconColor: primaryColor,
                labelText: "Choose value",
                border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(width: 4, color: primaryColor)),
              ),
              value: selectedValue,
              items: widget.state.routes.map((route) {
                return DropdownMenuItem(
                  value: route.name,
                  child: Text(route.name,
                      style: TextStyle(
                        fontFamily: font,
                      )),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                  chosenRoute = widget.state.routes.firstWhere(
                        (route) => route.name == value,
                  );
                });
              },
            ),
          ],
        ),
        SizedBox(
            width: double.infinity,
            height: double.tryParse('122'),
            child: ElevatedButton(
              onPressed: () {
                widget.bloc.add(ClickSelectRouteButtonAction(chosenRoute));
              },
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    primaryColor,
                  ),
                  shape: const WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16))))),
              child: Text(
                "Start Trip",
                style: TextStyle(
                  color: secondaryColor,
                  fontFamily: font,
                  fontSize: 46,
                ),
              ),
            ))
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
