
import 'package:ankitsayz/screen/splash/provider.dart';
import 'package:ankitsayz/screen/welcome/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen/home/provider.dart';

class MultiProviderGet extends StatelessWidget {
  final Widget child;

  const MultiProviderGet({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SplashProvider>(create: (_) => SplashProvider()),
        ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
        ChangeNotifierProvider<WelcomeProvider>(create: (_) => WelcomeProvider()),
      ],
      child: child,
    );
  }
}
