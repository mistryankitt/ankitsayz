import 'dart:developer';

import 'package:flutter/material.dart';

class WelcomeProvider extends ChangeNotifier {
  bool? onHover;

  void onHoverChange(bool value) {
    onHover = value;
    log(onHover.toString());
    notifyListeners();
  }

}
