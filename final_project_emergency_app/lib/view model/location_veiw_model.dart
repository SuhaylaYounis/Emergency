import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationViewModel with ChangeNotifier {
  final Geolocator _geolocator = Geolocator();
  String? _address;
  Position? _currentLocation;

  String? get address => _address;

  Future<void> updateLocation() async {
    try {
      _currentLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final List<Placemark> placemarks = await placemarkFromCoordinates(
        _currentLocation!.latitude,
        _currentLocation!.longitude,
      );

      if (placemarks.isNotEmpty) {
        final Placemark placemark = placemarks[0];
        _address = "${placemark.street}, ${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}";
        notifyListeners();
      }
    } catch (e) {
      print('Error updating location: $e');
    }
  }

}
