import 'dart:async';

import 'package:ankitsayz/main.dart';
import 'package:ankitsayz/routes/routes.dart';
import 'package:ankitsayz/screen/home/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashProvider extends ChangeNotifier {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  /// splash screen to navigate on Boarding screen
  void loadSplashScreen() {
    Timer(const Duration(seconds: 2), () async {
      scaffoldKey.currentContext != null
          ? Navigator.pushNamedAndRemoveUntil(scaffoldKey.currentContext!,
              AppRoutes.welcomePage, (route) => false)
          : null;
    });
  }
}
