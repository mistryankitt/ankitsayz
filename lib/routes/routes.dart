import 'package:ankitsayz/screen/experience/view.dart';
import 'package:ankitsayz/screen/home/view.dart';
import 'package:ankitsayz/screen/splash/view.dart';
import 'package:ankitsayz/screen/welcome/view.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class AppRoutes {
  static route(route) => MaterialPageRoute(builder: (_) => route);

  static const String splashRoute = "/";
  static const String welcomePage = "welcomePage";
  static const String homeRoute = "homePage";

  static Route? generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return route( GradientCursorDemo());
      case homeRoute:
        return route( HomePage());
      case welcomePage:
        return route(WelcomePage());
    }
    return null;
  }
}
