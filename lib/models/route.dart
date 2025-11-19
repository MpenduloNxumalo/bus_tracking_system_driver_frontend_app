import 'geolocation.dart';

class BusRoute {
  late final String _id;
  late final String _name;
  late final List<Geolocation> _locations;

  BusRoute(this._id, this._name, this._locations);

  List<Geolocation> get locations => _locations;
  String get name => _name;
  String get id => _id;

  @override
  String toString() {
    return 'Route{_id: $_id, _name: $_name, _locations: $_locations}';
  }
}
