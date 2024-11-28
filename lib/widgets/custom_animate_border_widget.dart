import 'package:flutter/material.dart';
import 'package:glowy_borders/glowy_borders.dart';

class CustomBorderAnimationWidget extends StatelessWidget {


  final Widget child;

  const CustomBorderAnimationWidget({super.key,  required this.child});



  @override
  Widget build(BuildContext context) {
    return  AnimatedGradientBorder(
      borderSize: 0.2,
      glowSize: 0,
      animationTime: 7,
      gradientColors: [
        Colors.white24,
        Colors.lightBlue,
        Colors.lightBlue,
        Colors.white
      ],
      animationProgress:null,
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: child,
    );
  }
}
