// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

Color primaryColor = Color(0xff1d3557);
Color secondaryColor = Color(0xff4288c2);
Color tertiaryColor = Color(0xffe63946);
Color backgroundColor = Color.fromARGB(255, 255, 255, 255);
Color textColor = Color(0xFF000000);
Color cardColor = Color(0xFF99CCED);
String theme = 'light';
ValueNotifier<int> refresh = ValueNotifier<int>(0);
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

void toggleTheme() {
  if (theme == 'dark') {
    backgroundColor = Color.fromARGB(255, 255, 255, 255);
    textColor = Color(0xFF000000);
    cardColor = Color(0xFF99CCED);
    theme = 'light';
  } else {
    backgroundColor = Color.fromARGB(255, 0, 0, 0);
    textColor = Color.fromARGB(255, 255, 255, 255);
    cardColor = Color(0XFF141414);
    theme = 'dark';
  }
  refresh.value++;
}
