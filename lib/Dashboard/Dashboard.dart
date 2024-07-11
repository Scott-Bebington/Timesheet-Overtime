// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:timesheet_overtime/Dashboard/DesktopDashboard.dart';
import 'package:timesheet_overtime/Dashboard/MobileDashboard.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return DesktopDashboard();
        } else {
          return Scaffold(
            body: MobileDashboard(),
          );
        }
      },
    );
  }
}
