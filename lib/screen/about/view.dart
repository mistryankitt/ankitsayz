import 'package:ankitsayz/generated/assets.dart';
import 'package:ankitsayz/screen/home/provider.dart';
import 'package:ankitsayz/utils/const.dart';
import 'package:ankitsayz/utils/size.dart';
import 'package:ankitsayz/utils/ui_const.dart';
import 'package:ankitsayz/widgets/custom_animate_border_widget.dart';
import 'package:ankitsayz/widgets/custom_button_widget.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glowy_borders/glowy_borders.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

import 'provider.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ReadmeProvider(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.read<ReadmeProvider>();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
        overlays: []);
    return Container(
      color: Colors.transparent,
      child: ResponsiveBuilder(builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Row(
                  //   children: [
                  //     // CustomBorderAnimationWidget(
                  //     //   child: Container(
                  //     //     // decoration: UiConstant.frostedGlassDecoration(),
                  //     //     child: Padding(
                  //     //       padding: const EdgeInsets.all(3.0),
                  //     //       child: ClipRRect(
                  //     //         borderRadius: BorderRadius.circular(15),
                  //     //         child: Image.network(
                  //     //           Constant.profileUrl,
                  //     //           height: 200,
                  //     //           width: 200,
                  //     //           fit: BoxFit.cover,
                  //     //         ),
                  //     //       ),
                  //     //     ),
                  //     //   ),
                  //     // ),
                  //     SizeUtils.gapWidthSize20,
                  //     Container(
                  //       width: 200.w,
                  //       child: Column(
                  //         children: [
                  //           CustomButtonWidget(
                  //               text: Constant.letsTalk,
                  //               isIcon: true,
                  //               iconWidget: Lottie.asset(Assets.lottieWhatsapp,
                  //                   height: 20, width: 20),
                  //               onTap: () {
                  //                 launchUrl(Uri.parse(Constant.whatsappUrl),
                  //                     mode: LaunchMode.platformDefault);
                  //               }),
                  //           SizeUtils.gapHeightSize15,
                  //           CustomButtonWidget(
                  //               text: Constant.myResume,
                  //               onTap: () {
                  //                 launchUrl(
                  //                     Uri.parse(Constant.myResumeDownloadUrl),
                  //                     mode: LaunchMode.platformDefault);
                  //               }),
                  //         ],
                  //       ),
                  //     )
                  //   ],
                  // ),
                  // SizeUtils.gapHeightSize15,
                  Align(
                    alignment: Alignment.center,
                    child: UiConstant.normalText(Constant.aboutHeadLine, 30),
                  ),
                  SizeUtils.gapHeightSize15,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 98.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: UiConstant.descriptionText(Constant.aboutIntro, 50),
                    ),
                  ),

                  SizeUtils.gapHeightSize40,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 98.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: UiConstant.descriptionText(Constant.aboutIntro2, 50),
                    ),
                  ),
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: UiConstant.normalText(Constant.contactMe, 20),
                  // ),
                  SizeUtils.gapHeightSize15,
                ],
              ),
            ),
          );
        }
        if (sizingInformation.deviceScreenType == DeviceScreenType.tablet ||
            sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return BounceInDown(
            duration: const Duration(milliseconds: 500),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: UiConstant.frostedGlassDecoration(),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            Constant.profileUrl,
                            height: 200,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizeUtils.gapHeightSize15,
                    Align(
                      alignment: Alignment.center,
                      child: UiConstant.normalText(Constant.myName, 30),
                    ),
                    SizeUtils.gapHeightSize15,
                    Container(
                      width: 300.w,
                      height: 50,
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomButtonWidget(
                                text: Constant.letsTalk,
                                isIcon: true,
                                iconWidget: Lottie.asset(Assets.lottieWhatsapp,
                                    height: 20, width: 20),
                                onTap: () {
                                  launchUrl(Uri.parse(Constant.whatsappUrl),
                                      mode: LaunchMode.platformDefault);
                                }),
                          ),
                          SizeUtils.gapWidthSize10,
                          Expanded(
                            child: CustomButtonWidget(
                                text: Constant.myResume,
                                onTap: () {
                                  launchUrl(
                                      Uri.parse(Constant.myResumeDownloadUrl),
                                      mode: LaunchMode.platformDefault);
                                }),
                          ),
                        ],
                      ),
                    ),
                    SizeUtils.gapHeightSize15,
                    UiConstant.descriptionTabText(Constant.aboutSelf, 14),
                    SizeUtils.gapHeightSize15,
                    Align(
                      alignment: Alignment.center,
                      child: UiConstant.normalText(Constant.contactMe, 20),
                    ),
                    SizeUtils.gapHeightSize15,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: provider.getContactMeList.map((e) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10.0, left: 10),
                          child: IconButton(
                            hoverColor: Colors.red,
                            icon: SvgPicture.asset(
                              e["icon"],
                              color: Colors.white54,
                              height: 20,
                              width: 20,
                            ),
                            onPressed: () {
                              launchUrl(Uri.parse(e["link"]),
                                  mode: LaunchMode.platformDefault);
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return Container();
      }),
    );
  }
}
