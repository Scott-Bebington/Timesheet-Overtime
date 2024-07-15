// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';
import 'package:timesheet_overtime/GlobalVariables.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:geolocator/geolocator.dart' as location;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DesktopDashboard extends StatefulWidget {
  const DesktopDashboard({super.key});

  @override
  State<DesktopDashboard> createState() => _DesktopDashboardState();
}

class _DesktopDashboardState extends State<DesktopDashboard> {
  GoogleMapController? _googleMapController;
  final Set<Marker> _markers = {};
  late CameraPosition _initialLocation = CameraPosition(
    target: LatLng(-28.284535, 24.402177),
    zoom: 5.0,
  );

  Future<LatLng> _getCurrentLocation() async {
    bool serviceEnabled = await location.Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print("Location services are disabled.");
      return Future.error("Location services are disabled.");
    }

    location.LocationPermission permission = await location.Geolocator.checkPermission();
    if (permission == location.LocationPermission.deniedForever) {
      print("Location permissions are permantly denied, we cannot request permissions.");
      return Future.error("Location permissions are permantly denied, we cannot request permissions.");
    }

    if (permission == location.LocationPermission.denied) {
      print("Location permissions are denied");
      permission = await location.Geolocator.requestPermission();
      if (permission != location.LocationPermission.whileInUse && permission != location.LocationPermission.always) {
        print("Location permissions are denied (actual value: $permission).");
        return Future.error("Location permissions are denied (actual value: $permission).");
      }
    }

    location.Position position = await location.Geolocator.getCurrentPosition(desiredAccuracy: location.LocationAccuracy.high);
    return LatLng(position.latitude, position.longitude);
  }

  @override
  void initState() {
    super.initState();
    _markers.add(
      Marker(
        markerId: const MarkerId('Address 1'),
        position: LatLng(-25.758878914381995, 28.238580084657446),
        infoWindow: const InfoWindow(
          title: 'Address 1',
          snippet: 'Address 1',
        ),
      ),
    );

    _initializeLocation();
  }

  Future<void> _initializeLocation() async {
    try {
      LatLng currentLocation = await _getCurrentLocation();
      setState(() {
        _initialLocation = CameraPosition(
          target: currentLocation,
          zoom: 14.0,
        );
        _markers.add(
          Marker(
            markerId: MarkerId('current_location'),
            position: currentLocation,
            infoWindow: InfoWindow(title: 'Current Location'),
          ),
        );
      });
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  @override
  void dispose() {
    try {
      if (_googleMapController != null && mounted) {
        _googleMapController?.dispose();
      }
      super.dispose();
    } catch (e) {
      print("Error disposing Google Map Controller: $e");
    }
  }

  List<SalesData> data = [
    SalesData('03/07', 5),
    SalesData('04/07', 4.5),
    SalesData('05/07', 7),
    SalesData('06/07', 2),
    SalesData('07/07', 1),
    SalesData('08/07', 8),
  ];

  final List<ChartData> chartData = [
    ChartData('David', 25),
    ChartData('Steve', 38),
    ChartData('Jack', 34),
    ChartData('Others', 52),
  ];

  Widget timesheet() {
    return Container(
      padding: EdgeInsets.all(desktopVariables.padding),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: primaryColor,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Text("Timesheet Data", style: TextStyle(fontSize: desktopVariables.subHeadingTextSize, fontWeight: FontWeight.bold, color: secondaryColor)),
          Row(
            children: [
              Expanded(
                child: SfCartesianChart(
                  primaryXAxis: const CategoryAxis(),
                  title: const ChartTitle(text: 'Weekly overview'),
                  series: <LineSeries<SalesData, String>>[
                    LineSeries<SalesData, String>(
                      dataSource: data,
                      xValueMapper: (SalesData sales, _) => sales.day,
                      yValueMapper: (SalesData sales, _) => sales.hoursWorked,
                      dataLabelSettings: DataLabelSettings(isVisible: true),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SfCircularChart(
                  title: ChartTitle(text: 'Time spent per job (hrs)'),
                  legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
                  series: <CircularSeries>[
                    PieSeries<ChartData, String>(
                      dataSource: chartData,
                      pointColorMapper: (ChartData data, _) => data.color,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                      dataLabelSettings: DataLabelSettings(isVisible: true),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget toDoList() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5 - 62.5,
      height: MediaQuery.of(context).size.height * 0.6,
      padding: EdgeInsets.all(desktopVariables.padding),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: primaryColor,
          width: 1,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text("To Do List", style: TextStyle(fontSize: desktopVariables.subHeadingTextSize, fontWeight: FontWeight.bold, color: secondaryColor)),
            SizedBox(height: desktopVariables.padding),
            for (int i = 0; i < 4; i++) ...[
              ListTile(
                title: Text("Task $i", style: TextStyle(fontSize: desktopVariables.cardBodyTextSize, fontWeight: FontWeight.bold, color: secondaryColor)),
                subtitle: Text("Description of task $i", style: TextStyle(fontSize: desktopVariables.cardBodyTextSize, color: Colors.black)),
                trailing: Checkbox(value: false, onChanged: (bool? value) {}),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget overtime() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5 - 62.5,
      height: MediaQuery.of(context).size.height * 0.6,
      padding: EdgeInsets.all(desktopVariables.padding),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: primaryColor,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Text("Overtime", style: TextStyle(fontSize: desktopVariables.subHeadingTextSize, fontWeight: FontWeight.bold, color: secondaryColor)),
          SizedBox(height: desktopVariables.padding),
          Expanded(
            child: SfCartesianChart(
              primaryXAxis: const CategoryAxis(),
              title: const ChartTitle(text: 'Weekly overview'),
              series: <ColumnSeries<SalesData, String>>[
                ColumnSeries<SalesData, String>(
                  dataSource: data,
                  xValueMapper: (SalesData sales, _) => sales.day,
                  yValueMapper: (SalesData sales, _) => sales.hoursWorked,
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                ),
              ],
            ),
          ),
          SizedBox(height: desktopVariables.padding),
          Text("Total Overtime: 27 hours", style: TextStyle(fontSize: desktopVariables.cardBodyTextSize, fontWeight: FontWeight.bold, color: secondaryColor)),
        ],
      ),
    );
  }

  Widget vehicleStats() {
    return Container(
      width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.only(top: desktopVariables.padding, bottom: desktopVariables.padding),
      padding: EdgeInsets.all(desktopVariables.padding),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: primaryColor,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Text("Vehicle Stats", style: TextStyle(fontSize: desktopVariables.subHeadingTextSize, fontWeight: FontWeight.bold, color: secondaryColor)),
          SizedBox(height: desktopVariables.padding),
          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (int i = 0; i < 4; i++) ...[
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onDoubleTap: () {
                            
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Date $i", style: TextStyle(fontSize: desktopVariables.cardBodyTextSize, fontWeight: FontWeight.bold, color: secondaryColor)),
                              SizedBox(height: desktopVariables.padding),
                              Text("Distance: 1000", style: TextStyle(fontSize: desktopVariables.cardBodyTextSize, color: Colors.black)),
                              Text("From: Address $i", style: TextStyle(fontSize: desktopVariables.cardBodyTextSize, color: Colors.black)),
                              Text("To: Address $i", style: TextStyle(fontSize: desktopVariables.cardBodyTextSize, color: Colors.black)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: desktopVariables.padding),
                    ],
                  ],
                ),
              ),
              SizedBox(height: desktopVariables.padding),
              Text("Total Distance travelled: 4000", style: TextStyle(fontSize: desktopVariables.cardBodyTextSize, fontWeight: FontWeight.bold, color: secondaryColor)),
              SizedBox(height: desktopVariables.padding),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.7,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  child: GoogleMap(
                    myLocationButtonEnabled: true,
                    zoomControlsEnabled: true,
                    onMapCreated: (controller) {
                      _googleMapController = controller;
                    },
                    initialCameraPosition: _initialLocation,
                    markers: _markers,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 115,
      margin: EdgeInsets.only(top: desktopVariables.padding, left: 105, right: desktopVariables.padding),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            timesheet(),
            SizedBox(height: desktopVariables.padding),
            Row(
              children: [
                toDoList(),
                SizedBox(width: desktopVariables.padding),
                overtime(),
              ],
            ),
            SizedBox(height: desktopVariables.padding),
            vehicleStats(),
            // SizedBox(height: desktopVariables.padding),
          ],
        ),
      ),
    );
  }
}

class SalesData {
  SalesData(this.day, this.hoursWorked);
  final String day;
  final double hoursWorked;
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}
