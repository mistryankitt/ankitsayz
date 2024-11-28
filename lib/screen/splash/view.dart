import 'package:ankitsayz/generated/assets.dart';
import 'package:ankitsayz/screen/home/provider.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart' as rive;

import 'provider.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeProvider>(context, listen: false).titleChange(-1);

    });

    return _buildPage(context);
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.read<SplashProvider>();
    provider.loadSplashScreen();
    return FadeIn(
      duration: const Duration(milliseconds: 500),
      child: FadeOut(
        delay: const Duration(seconds: 2),
        child: Scaffold(
          backgroundColor: Colors.black87,
          key: provider.scaffoldKey,
          body: Container(
            decoration:  const BoxDecoration(
                gradient: RadialGradient(
                    radius: 0.88,
                    stops: [0.1, 0.5, 0.8],
                    colors: [Colors.black45, Colors.black87, Colors.black]
                )
            ),
            child: Center(
              child: SizedBox(
                height: 100.h,
                width: 100.w,
                child: const Center(
                    child: rive.RiveAnimation.asset(
                        animations: ['slowDance'], Assets.riveFlutterDance)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
