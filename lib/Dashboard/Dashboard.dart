// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:timesheet_overtime/Dashboard/DesktopDashboard.dart';
import 'package:timesheet_overtime/Dashboard/MobileDashboard.dart';
import 'package:timesheet_overtime/Dashboard/TabletDashboard.dart';

class DashboardVAF {
  static late GoogleMapController googleMapController;
  static final Set<Marker> markers = {};
  static CameraPosition initialLocation = CameraPosition(
    target: LatLng(-28.284535, 24.402177),
    zoom: 5.0,
  );

  static Future<LatLng> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print("Location services are disabled.");
      return Future.error("Location services are disabled.");
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      print("Location permissions are permantly denied, we cannot request permissions.");
      return Future.error("Location permissions are permantly denied, we cannot request permissions.");
    }

    if (permission == LocationPermission.denied) {
      print("Location permissions are denied");
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
        print("Location permissions are denied (actual value: $permission).");
        return Future.error("Location permissions are denied (actual value: $permission).");
      }
    }

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return LatLng(position.latitude, position.longitude);
  }

  static Future<void> initializeLocation() async {
    try {
      LatLng currentLocation = await _getCurrentLocation();
      initialLocation = CameraPosition(
        target: currentLocation,
        zoom: 14.0,
      );
      markers.add(
        Marker(
          markerId: MarkerId('current_location'),
          position: currentLocation,
          infoWindow: InfoWindow(title: 'Current Location'),
        ),
      );
    } catch (e) {
      print("Error getting location: $e");
    }
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  void initState() {
    super.initState();
    DashboardVAF.markers.add(
      Marker(
        markerId: const MarkerId('Address 1'),
        position: LatLng(-25.758878914381995, 28.238580084657446),
        infoWindow: const InfoWindow(
          title: 'Address 1',
          snippet: 'Address 1',
        ),
      ),
    );

    DashboardVAF.initializeLocation();
  }


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1000) {
          return DesktopDashboard();
        } else if (constraints.maxWidth > 600) {
          return TabletDashboard();
        } else {
          return Scaffold(
            body: MobileDashboard(),
          );
        }
      },
    );
  }
}
