import 'dart:developer';

import 'package:ankitsayz/generated/assets.dart';
import 'package:ankitsayz/utils/const.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  int selectedMenuBarIndex = 0;

  var pageName = Constant.loadingPortfolio;




  titleChange(int value) {
    if (value == -2) {
      pageName = Constant.loadingPortfolio;
    }else if (value == -1) {
      pageName = Constant.welcomePortfolio;
    } else if (value == 0) {
      pageName = Constant.about;
    } else if (value == 1) {
      pageName = Constant.main;
    } else if (value == 2) {
      pageName = Constant.projects;
    }
    notifyListeners();
  }

  void changeMenuBar(int index) {
    selectedMenuBarIndex = index;
    log("$selectedMenuBarIndex");
    notifyListeners();
  }
}
