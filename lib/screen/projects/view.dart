import 'package:ankitsayz/utils/const.dart';
import 'package:ankitsayz/utils/size.dart';
import 'package:ankitsayz/utils/ui_const.dart';
import 'package:ankitsayz/widgets/custom_button_widget.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'provider.dart';

class ProjectsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ProjectsProvider(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.read<ProjectsProvider>();

    return ResponsiveBuilder(
      builder: (context,SizingInformation sizingInformation) {
    if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
      return BounceInDown(
        duration: const Duration(milliseconds: 500),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                UiConstant.normalText(Constant.myProjectsHead, 20),
                SizeUtils.gapHeightSize10,
                MasonryGridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                   // gridDelegate:
                    // SliverGridDelegateWithFixedCrossAxisCount(
                    //   crossAxisCount: sizingInformation.deviceScreenType ==
                    //       DeviceScreenType.mobile ? 1 : 2, // 2 columns
                    //   crossAxisSpacing:
                    //   16.0, // Adjust as needed
                    //   mainAxisSpacing:
                    //   16.0,
                    //   mainAxisExtent: sizingInformation.deviceScreenType ==
                    //   DeviceScreenType.mobile ? 100 : 220
                    // ),
                    itemCount: provider.myProjectsList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
            
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration:
                          UiConstant.frostedGlassDecoration(),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                      BorderRadius.circular(15),
                                      child: Image.network(
                                        provider.myProjectsList[index]
                                        ["project_logo"],
                                        fit: BoxFit.cover,
                                        height: 180,
                                        width: 180,
                                      ),
                                    ),
                                    SizeUtils.gapHeightSize10,
                                    CustomButtonWidget(text: 'Google play', onTap: () {  }),
                                      SizeUtils.gapHeightSize10,
                                    CustomButtonWidget(text: 'Apple store', onTap: () {  },)
            
                                  ],
                                ),
                              ),
                              SizeUtils.gapWidthSize10,
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    UiConstant.normalText(
                                        provider.myProjectsList[
                                        index]["project_name"],
                                        18),
                                    UiConstant.descriptionText(
                                        provider.myProjectsList[
                                        index]
                                        ["project_description"],
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
        ),
      );
    }
    if (sizingInformation.deviceScreenType == DeviceScreenType.tablet || sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
      return BounceInDown(
        duration: const Duration(milliseconds: 500),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                UiConstant.normalText(Constant.myProjectsHead, 20),
                SizeUtils.gapHeightSize10,
                MasonryGridView.count(
                    crossAxisCount: 1,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    // gridDelegate:
                    // SliverGridDelegateWithFixedCrossAxisCount(
                    //   crossAxisCount: 1, // 2 columns
                    //   crossAxisSpacing:
                    //   16.0, // Adjust as needed
                    //   mainAxisSpacing:
                    //   16.0,
                    //   // mainAxisExtent: sizingInformation.deviceScreenType ==
                    //   // DeviceScreenType.mobile ? 100 : 220
                    // ),
                    itemCount: provider.myProjectsList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
            
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration:
                          UiConstant.frostedGlassDecoration(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
            
                              UiConstant.normalText(
                                  provider.myProjectsList[
                                  index]["project_name"],
                                  18),
                              UiConstant.descriptionText(
                                  provider.myProjectsList[
                                  index]
                                  ["project_description"],
                                  14),
                              SizeUtils.gapHeightSize15,
            
                              ClipRRect(
                                borderRadius:
                                BorderRadius.circular(15),
                                child: Image.network(
                                  provider.myProjectsList[index]
                                  ["project_logo"],
                                  fit: BoxFit.cover,
                                  width: double.infinity,
            
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
        ),
      );      }
    return Container();

      }
    );
  }
}

