import 'package:ankitsayz/utils/const.dart';
import 'package:ankitsayz/utils/size.dart';
import 'package:ankitsayz/utils/ui_const.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'provider.dart';

class ExperiencePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ExperienceProvider(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
        overlays: []);
    final provider = context.read<ExperienceProvider>();
    return ResponsiveBuilder(
        builder: (context, SizingInformation sizingInformation) {
      if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
        return BounceInDown(
          duration: const Duration(milliseconds: 500),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UiConstant.normalText(Constant.mySkillsHead, 20),
                SizeUtils.gapHeightSize10,
                Container(
                  height: 130,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: provider.mySkillsList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration:
                                    UiConstant.frostedGlassDecoration(),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      provider.mySkillsList[index]
                                          ["skill_image"],
                                      fit: BoxFit.cover,
                                      height: 100,
                                      width: 100,
                                    ),
                                  ),
                                ),
                              ),
                              SizeUtils.gapHeightSize10,
                              // UiConstant.normalText(
                              //     provider.mySkillsList[index]
                              //         ["skill_name"],
                              //     20),
                            ],
                          ),
                        );
                      }),
                ),
                // SizeUtils.gapHeightSize10,
                UiConstant.normalText(Constant.myExperienceHead, 20),
                SizeUtils.gapHeightSize10,
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: provider.myExperienceList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: UiConstant.frostedGlassDecoration(),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  provider.myExperienceList[index]
                                      ["experience_image"],
                                  fit: BoxFit.cover,
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                              SizeUtils.gapWidthSize10,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    UiConstant.normalText(
                                        provider.myExperienceList[index]
                                            ["experience_name"],
                                        20),
                                    UiConstant.normalText(
                                        provider.myExperienceList[index]
                                            ["experience_description"],
                                        14),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UiConstant.normalText(Constant.mySkillsHead, 20),
                  SizeUtils.gapHeightSize10,
                  Container(
                    height: 130,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: provider.mySkillsList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration:
                                      UiConstant.frostedGlassDecoration(),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        provider.mySkillsList[index]
                                            ["skill_image"],
                                        fit: BoxFit.cover,
                                        height: 100,
                                        width: 100,
                                      ),
                                    ),
                                  ),
                                ),
                                SizeUtils.gapHeightSize10,
                                // UiConstant.normalText(
                                //     provider.mySkillsList[index]
                                //         ["skill_name"],
                                //     20),
                              ],
                            ),
                          );
                        }),
                  ),
                  // SizeUtils.gapHeightSize10,
                  UiConstant.normalText(Constant.myExperienceHead, 20),
                  SizeUtils.gapHeightSize10,
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: provider.myExperienceList.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          decoration: UiConstant.frostedGlassDecoration(),
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  UiConstant.normalText(
                                      provider.myExperienceList[index]
                                          ["experience_name"],
                                      20),
                                  UiConstant.descriptionText(
                                      provider.myExperienceList[index]
                                          ["experience_description"],
                                      15),
                                ],
                              ),
                              SizeUtils.gapHeightSize15,
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  provider.myExperienceList[index]
                                      ["experience_image"],
                                  fit: BoxFit.cover,
                                  // height: 100.h,
                                  width: double.infinity,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
        );
      }
      return Container();
    });
  }
}
