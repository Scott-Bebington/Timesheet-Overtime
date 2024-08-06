// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:timesheet_overtime/Auth/AuthGate.dart';
import 'package:timesheet_overtime/GlobalVariables.dart';
import 'package:timesheet_overtime/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const TimesheetApp());
}

class TimesheetApp extends StatefulWidget {
  const TimesheetApp({super.key});

  @override
  State<TimesheetApp> createState() => _TimesheetAppState();
}

class _TimesheetAppState extends State<TimesheetApp> {

  @override
  void initState() {
    super.initState();
    refresh.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(body: AuthGate()),
    );
  }
}
