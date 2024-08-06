// ignore_for_file: prefer_const_constructors, file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:timesheet_overtime/Projects/DesktopProjects.dart';
import 'package:timesheet_overtime/Projects/MobileProjects.dart';
import 'package:timesheet_overtime/Projects/TabletProjects.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  static List<Map<String, dynamic>> projectsToDoData = [
    {
      'task': 'task 1',
      'id': 1,
    },
    {
      'task': 'task 2',
      'id': 2,
    },
    {
      'task': 'task 3',
      'id': 3,
    },
  ];

  static List<Map<String, dynamic>> projectsInProgressData = [];

  static List<Map<String, dynamic>> projectsDoneData = [];

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1000) {
          return DesktopProjects();
        } else if (constraints.maxWidth > 600) {
          return TabletProjects();
        } else {
          return Scaffold(
            body: MobileProjects(),
          );
        }
      },
    );
  }
}
