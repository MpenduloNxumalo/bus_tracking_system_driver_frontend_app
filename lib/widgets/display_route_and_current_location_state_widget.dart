import 'package:bus_tracking_system_driver_frontend_app/widgets/app_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';


class DisplayRouteAndCurrentLocationStateWidget extends AppWidget {
  const DisplayRouteAndCurrentLocationStateWidget({super.key});

  @override
  State<DisplayRouteAndCurrentLocationStateWidget> createState() => _DisplayRouteAndCurrentLocationStateWidgetState();
}

class _DisplayRouteAndCurrentLocationStateWidgetState extends State<DisplayRouteAndCurrentLocationStateWidget> {
  @override
  Widget build(BuildContext context) {
    return MapWidget();
  }
}
