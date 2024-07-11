// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:timesheet_overtime/GlobalVariables.dart';
import 'package:typewritertext/typewritertext.dart';

class DesktopNavbar extends StatefulWidget {
  const DesktopNavbar({Key? key});

  @override
  State<DesktopNavbar> createState() => _DesktopNavbarState();
}

class _DesktopNavbarState extends State<DesktopNavbar> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _animation = Tween<double>(begin: 0, end: 125).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget navbarItem(String text, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(left: 2.75),
      child: IconButton(
        onPressed: () {},
        icon: Row(
          children: [
            Icon(
              icon,
              size: 30,
            ),
            if (isExpanded) ...[
              SizedBox(width: 10),
              TypeWriter(
                controller: TypeWriterController(
                  text: text,
                  duration: const Duration(milliseconds: 20),
                ),
                builder: (context, value) {
                  return Text(
                    value.text,
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: desktopVariables.bodyTextSize,
                    ),
                  );
                },
              ),
            ],
          ],
        ),
        color: primaryColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isExpanded = true;
        });
        _animationController.forward();
      },
      onExit: (_) {
        setState(() {
          isExpanded = false;
        });
        _animationController.reverse();
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Container(
            margin: EdgeInsets.all(desktopVariables.padding),
            padding: EdgeInsets.all(desktopVariables.padding),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: primaryColor,
                width: 1,
              ),
            ),
            width: 75 + _animation.value,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                navbarItem("Dashboard", Icons.space_dashboard_outlined),
                SizedBox(height: 10),
                Divider(),
                SizedBox(height: 10),
                navbarItem("Timesheet", Icons.calendar_month_outlined),
                SizedBox(height: 10),
                navbarItem("Overtime", Icons.more_time),
                SizedBox(height: 10),
                Divider(),
                SizedBox(height: 10),
                navbarItem("Location", Icons.location_on_outlined),
                Spacer(),
                navbarItem("Toggle theme", Icons.light_mode_outlined),
                SizedBox(height: 20),
                navbarItem("Logout", Icons.logout),
              ],
            ),
          );
        },
      ),
    );
  }
}
