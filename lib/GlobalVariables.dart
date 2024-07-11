import 'package:flutter/material.dart';

const Color primaryColor = Color(0xff1d3557);
const Color secondaryColor = Color(0xff4288c2);
const Color tertiaryColor = Color(0xffe63946);
const Color backgroundColor = Color.fromARGB(255, 255, 255, 255);
const Color textColor = Color(0xFF000000);
const Color cardColor = Color.fromARGB(255, 255, 255, 255);
DesktopVariables desktopVariables = DesktopVariables();
TabletVariables tabletVariables = TabletVariables();
MobileVariables mobileVariables = MobileVariables();

class DesktopVariables {
  final double headingTextSize = 50;
  final double subHeadingTextSize = 40;
  final double cardHeadingTextSize = 30;
  final double bodyTextSize = 16;
  final double cardBodyTextSize = 14;
  final double padding = 10;
}

class TabletVariables {
  final double headingTextSize = 40;
  final double subHeadingTextSize = 30;
  final double cardHeadingTextSize = 24;
  final double bodyTextSize = 14;
  final double cardBodyTextSize = 14;
  final double padding = 10;
}

class MobileVariables {
  final double headingTextSize = 40;
  final double subHeadingTextSize = 30;
  final double cardHeadingTextSize = 20;
  final double bodyTextSize = 12;
  final double cardBodyTextSize = 12;
  final double padding = 10;
}
