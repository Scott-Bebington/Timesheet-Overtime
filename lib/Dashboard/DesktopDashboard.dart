// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';
import 'package:timesheet_overtime/GlobalVariables.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DesktopDashboard extends StatefulWidget {
  const DesktopDashboard({super.key});

  @override
  State<DesktopDashboard> createState() => _DesktopDashboardState();
}

class _DesktopDashboardState extends State<DesktopDashboard> {
  List<SalesData> data = [
    SalesData('03/07', 5),
    SalesData('04/07', 4.5),
    SalesData('05/07', 7),
    SalesData('06/07', 2),
    SalesData('07/07', 1),
    SalesData('08/07', 8),
    SalesData('09/07', 5),
    SalesData('10/07', 6.25),
  ];

  final List<ChartData> chartData = [ChartData('David', 25), ChartData('Steve', 38), ChartData('Jack', 34), ChartData('Others', 52)];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: desktopVariables.padding, left: 105, right: desktopVariables.padding, bottom: desktopVariables.padding),
      padding: EdgeInsets.all(desktopVariables.padding),
      constraints: BoxConstraints(
        minWidth: 400,
        maxWidth: 900,
      ),
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: primaryColor,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          SfCartesianChart(
            // Initialize category axis
            primaryXAxis: const CategoryAxis(),
            title: const ChartTitle(text: 'Hours worked per day'),
            series: <LineSeries<SalesData, String>>[
              LineSeries<SalesData, String>(
                // Bind data source
                dataSource: data,
                xValueMapper: (SalesData sales, _) => sales.day,
                yValueMapper: (SalesData sales, _) => sales.hoursWorked,
              ),
            ],
          ),
          SfCircularChart(
            series: <CircularSeries>[
              // Render pie chart
              PieSeries<ChartData, String>(
                dataSource: chartData,
                pointColorMapper: (ChartData data, _) => data.color,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
              )
            ],
          ),
        ],
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
