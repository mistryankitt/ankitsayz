import 'dart:developer';
import 'dart:ui';

import 'package:ankitsayz/generated/assets.dart';
import 'package:ankitsayz/screen/about/view.dart';
import 'package:ankitsayz/screen/experience/view.dart';
import 'package:ankitsayz/screen/projects/view.dart';
import 'package:ankitsayz/utils/const.dart';
import 'package:ankitsayz/utils/ui_const.dart';
import 'package:ankitsayz/widgets/custom_tab_bar.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:rive/rive.dart';

import 'provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildPage(context);
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.read<HomeProvider>();

    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.black,
      // decoration:  BoxDecoration(
      //     image: DecorationImage(
      //         image: ),),
      child: Stack(
        children: [
          // const RiveAnimation.asset(
          //   Assets.riveBirb,
          //   fit: BoxFit.cover,
          // ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: LayoutBuilder(builder: (context, constraints) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 150, sigmaY: 160),
                  child: Container(
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      decoration: UiConstant.frostedGlassDecoration(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildHeader(),
                          _buildSideBarMenu(context, constraints),
                          buildFooter()
                        ],
                      )),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildSideBarMenu(context, constraints) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) {
        return Expanded(
          child: ResponsiveBuilder(
            builder:
                (BuildContext context, SizingInformation sizingInformation) {
              if (sizingInformation.deviceScreenType ==
                  DeviceScreenType.desktop) {
                return CustomTabBar(
                  screen1Title: Constant.aboutTitle,
                  screen2Title: Constant.mainTitle,
                  screen3Title: Constant.projectsTitle,
                  onTap: (value) {
                    log("selected ==> $value");
                    provider.titleChange(value!);
                  },
                  screen1: const AboutMePage(),
                  screen2: ExperiencePage(),
                  screen3: ProjectsPage(),
                );
              }

              if (sizingInformation.deviceScreenType ==
                  DeviceScreenType.tablet) {
                return CustomTabBar(
                  screen1Title: Constant.aboutTitle,
                  screen2Title: Constant.mainTitle,
                  screen3Title: Constant.projectsTitle,
                  onTap: (value) {
                    log("selected ==> $value");
                    provider.titleChange(value!);
                  },
                  screen1: const AboutMePage(),
                  screen2: ExperiencePage(),
                  screen3: ProjectsPage(),
                );
              }

              if (sizingInformation.deviceScreenType ==
                  DeviceScreenType.mobile) {
                return CustomTabBar(
                  screen1Title: Constant.aboutTitle,
                  screen2Title: Constant.mainTitle,
                  screen3Title: Constant.projectsTitle,
                  onTap: (value) {
                    log("selected ==> $value");
                    provider.titleChange(value!);
                  },
                  screen1: const AboutMePage(),
                  screen2: ExperiencePage(),
                  screen3: ProjectsPage(),
                );
              }
              return Container(color: Colors.purple);
            },
          ),
        );
      },
    );
  }

  Widget buildHeader() {
    return Container(
      height: 30.h,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipOval(
                    child: Container(
                      height: 10,
                      width: 10,
                      color: Colors.redAccent,
                    ),
                  ),
                  ClipOval(
                    child: Container(
                      height: 10,
                      width: 10,
                      color: Colors.yellow,
                    ),
                  ),
                  ClipOval(
                    child: Container(
                      height: 10,
                      width: 10,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: DefaultTextStyle(
                style: GoogleFonts.montserrat(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w200,
                  shadows: [
                    const Shadow(
                      blurRadius: 10.0,
                      color: Colors.white,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: AnimatedTextKit(
                  repeatForever: true,

                  animatedTexts: [
                    FlickerAnimatedText('WELCOME TO'),
                    FlickerAnimatedText('MY PORTFOLIO'),
                  ],
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildFooter() {
    return Container(
      height: 30.h,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      child: Consumer<HomeProvider>(builder: (context, provider, child) {
        return Center(
          child: DefaultTextStyle(
            style: GoogleFonts.montserrat(
              fontSize: 15.sp,
              color: Colors.white,
              fontWeight: FontWeight.w200,
              // shadows: [
              //   const Shadow(
              //     blurRadius: 10.0,
              //     color: Colors.white,
              //     offset: Offset(0, 0),
              //   ),
              // ],
            ),
            child: UiConstant.normalText(Constant.copyRight, 10),
          ),
        );
      }),
    );
  }
}
