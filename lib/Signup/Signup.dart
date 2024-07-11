import 'package:flutter/material.dart';
import 'package:timesheet_overtime/Signup/DesktopSignup.dart';
import 'package:timesheet_overtime/Signup/MobileSignup.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
     return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return const Scaffold(
            body: DesktopSignup(),
          );
        } else {
          return const Scaffold(
            body: MobileSignup(),
          );
        }
      },
    );
  }
}