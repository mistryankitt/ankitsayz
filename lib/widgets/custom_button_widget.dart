import 'dart:developer';

import 'package:ankitsayz/utils/ui_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
class CustomButtonWidget extends StatefulWidget {
  final String text;
  final void Function()? onTap;
   Color? color;
   Color? textColor;
  final Color? borderColor;
   bool isColorChange;
  final bool isBorder;
  final bool isBorderColor;
  final Widget? iconWidget;

  final bool isIcon;
  final String? iconString;
   bool isTextColorChange;

   CustomButtonWidget(
      {Key? key,
      required this.text,
      required this.onTap,
      this.color,
      this.isColorChange = false,
      this.isBorder = false,
      this.isIcon = false,
      this.isBorderColor = false,
      this.iconString,
      this.borderColor,
      this.isTextColorChange = false,
      this.textColor,  this.iconWidget})
      : super(key: key);

  @override
  State<CustomButtonWidget> createState() => _CustomButtonWidgetState();
}

class _CustomButtonWidgetState extends State<CustomButtonWidget> {

  double _width = 50;
  double _height = 45;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(10);

  @override
  Widget build(BuildContext context) {
    HapticFeedback.selectionClick();
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: _borderRadius,
        side: widget.isBorder
            ? BorderSide(
                color: widget.isBorderColor ? widget.borderColor! : Colors.white54, width: 1)
            : BorderSide(color: Colors.white54, width: 0),
      ),
      color: widget.isColorChange ? widget.color : Colors.black87,
      //borderRadius: BorderRadius.circular(30),
      child: InkWell(
        onTap: widget.onTap,
        onHover: (value){


          if(value){
            setState(() {

              // _width = 60;
              _height = 50;
              _borderRadius =
                  BorderRadius.circular(20);
            });
            // setState(() {
              widget.isColorChange = true;
              widget.isTextColorChange = true;
              widget.color = Colors.white;
              widget.textColor = Colors.black;
            // });
          }else{
            setState(() {
              // _width = 50;
              _height = 45;
              _borderRadius =
                  BorderRadius.circular(10);
              widget.isColorChange = false;
              widget.isTextColorChange = false;
              widget.textColor = Colors.black;

              widget.color = Colors.black87;
            });



          }
          log(" ${widget.isTextColorChange}");
        },
        customBorder: widget.isBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.black87, width: 5.0))
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.black87, width: 0.0)),
        child:Center(
          child: AnimatedContainer(
            // Use the properties stored in the State class.
            width: MediaQuery.of(context).size.width,
            height: _height,
            // Define how long the animation should take.
            duration: const Duration(milliseconds: 100),
            // Provide an optional curve to make the animation feel smoother.
            curve: Curves.fastOutSlowIn,
            child:
            SizedBox(
                height: _height,
                width: MediaQuery.of(context).size.width,
                child: widget.isIcon
                    ? Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            UiConstant.normalText(
                              widget.text,
                              14,
                              color: widget.isTextColorChange ? widget.textColor : Colors.white
                              // style: const TextStyle(
                              //     color: Colors.white,
                              //     fontWeight: FontWeight.w800,
                              //     fontFamily: "sfpro"),
                            ),
                            3.widthBox,
                            widget.iconWidget!,
                            // Image.asset(
                            //   iconString!,
                            //   scale: 4.5,
                            // ),
                          ],
                        ),
                    )
                    :
                TweenAnimationBuilder<double>(
                  duration: Duration(milliseconds: 100),
                  tween: Tween<double>(begin: _height.toInt() - 30, end: _height.toInt() - 30),
                  builder: (_, size, __) => UiConstant.normalText(
                      widget.text,
                     size.toInt(),
                      color: widget.isTextColorChange ? widget.textColor : Colors.white

                  ).centered(),
                )
                ),

          ),
        )

      ),
    );
  }
}
