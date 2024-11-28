import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class UiConstant {
  static BoxDecoration frostedGlassDecoration() => BoxDecoration(
      gradient: const LinearGradient(
          colors: [Colors.white30, Colors.white12],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter),
      boxShadow: const [
        BoxShadow(
            blurRadius: 6,
            spreadRadius: 0,
            color: Colors.black54,
            offset: Offset(0.0, 0.0))
      ],
      borderRadius: BorderRadius.circular(20),
      border: Border.all(width: 2, color: Colors.white30));

  static Text normalText(String? text, int? size, {Color? color}) => Text(
        "$text",
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
        style: GoogleFonts.montserrat(
            color: color ?? Colors.white,
            fontSize: size!.spMin,

            fontWeight: FontWeight.w600),
      );


  static Text descriptionText(String? text, int? size) => Text(
        "$text",
        textAlign:  TextAlign.center,

        style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: size?.spMin ?? 12.spMin,
            // textStyle: TextStyle(),
            fontWeight: FontWeight.w600),
      );

  static Text descriptionTabText(String? text, int? size) => Text(
        "$text",
        textAlign:  TextAlign.center,

        style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: size?.sp ?? 12.sp,
            // textStyle: TextStyle(),
            fontWeight: FontWeight.w400),
      );
}
