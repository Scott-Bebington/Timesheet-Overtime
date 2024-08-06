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
  bool areLogoutandToggleThemeVisible = false;

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

  Widget navbarItem({
    required String text,
    IconData? icon,
    Function()? onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 2.75),
      child: IconButton(
        onPressed: onPressed,
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
                      color: textColor,
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
          areLogoutandToggleThemeVisible = false;
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
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: primaryColor,
                width: 1,
              ),
            ),
            width: 75 + _animation.value,
            height: double.infinity,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        navbarItem(
                          text: "Projects",
                          icon: Icons.space_dashboard_outlined,
                          onPressed: () {
                            print("Navigate to projects");
                          },
                        ),
                        SizedBox(height: 10),
                        Divider(),
                        SizedBox(height: 10),
                        navbarItem(
                          text: "Timesheet",
                          icon: Icons.calendar_month_outlined,
                          onPressed: () {
                            print("Navigate to timesheet");
                          },
                        ),
                        SizedBox(height: 10),
                        navbarItem(
                          text: "Overtime",
                          icon: Icons.more_time,
                          onPressed: () {
                            print("Navigate to overtime");
                          },
                        ),
                        SizedBox(height: 10),
                        Divider(),
                        SizedBox(height: 10),
                        navbarItem(
                          text: "Location",
                          icon: Icons.location_on_outlined,
                          onPressed: () {
                            print("Navigate to location");
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    if (areLogoutandToggleThemeVisible) ...[
                      SizedBox(height: 10),
                      navbarItem(
                        text: "Toggle theme",
                        icon: Icons.light_mode_outlined,
                        onPressed: () {
                          toggleTheme();
                        },
                      ),
                      SizedBox(height: 10),
                      navbarItem(
                        text: "Logout",
                        icon: Icons.logout,
                        onPressed: () {
                          print("Logout pressed");
                        },
                      ),
                      SizedBox(height: 10),
                    ],
                    navbarItem(
                      text: "Scott Bebington",
                      icon: Icons.person,
                      onPressed: () {
                        setState(() {
                          areLogoutandToggleThemeVisible = !areLogoutandToggleThemeVisible;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
