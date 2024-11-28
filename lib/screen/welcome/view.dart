import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ankitsayz/generated/assets.dart';
import 'package:ankitsayz/routes/routes.dart';
import 'package:ankitsayz/screen/home/provider.dart';
import 'package:ankitsayz/utils/ui_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart' as rive;
import 'package:velocity_x/velocity_x.dart';

import 'provider.dart';

class WelcomePage extends StatefulWidget {
   WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return _buildPage(context);
  }

  TabController? tabController;

  late ScrollController scrollController;

  final List<GlobalKey> jewelleryCategories = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];
  /// Tab Context
  BuildContext? tabContext;

  /// Scroll to Index
  void scrollToIndex(int index) async {
    scrollController.removeListener(animateToTab);
    final categories = jewelleryCategories[index].currentContext!;
    await Scrollable.ensureVisible(
      categories,
      duration: const Duration(milliseconds: 600),
    );
    scrollController.addListener(animateToTab);
  }
  @override
  void initState() {
    // TODO: implement initState
    scrollController = ScrollController();

    tabController = TabController(length: 3, vsync: this);

    scrollController.addListener(animateToTab);

    super.initState();
  }
  /// Animate To Tab
  void animateToTab() {
    late RenderBox box;
    for (var i = 0; i < jewelleryCategories.length; i++) {
      box = jewelleryCategories[i].currentContext!.findRenderObject()
      as RenderBox;
      Offset position = box.localToGlobal(Offset.zero);

      if (scrollController.offset >= position.dy) {
        DefaultTabController.of(tabContext!).animateTo(
          i,
          duration: const Duration(milliseconds: 100),
        );
      }
    }
  }
  Widget _buildPage(BuildContext context) {
    final provider = context.read<WelcomeProvider>();
    tabContext = context;

    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(image: AssetImage(Assets.imagesBlurCircle, ),
                opacity: 0.2,

                colorFilter: ColorFilter.mode(Colors.transparent,BlendMode.multiply))
              // gradient: RadialGradient(
              //     radius: 0.88,
              //     stops: [0.1, 0.5, 0.8],
              //     colors: [Colors.white, Colors.white12, Colors.white10])
          ),
          child: Consumer<WelcomeProvider>(
            builder: (context, provider, child) {
              return FadeIn(
                animate: true,
                duration: Duration(seconds: 6),
                child: Container(
                  height: 400.h,
                  width: 400.w,
                  color: Colors.transparent,
                  // decoration: const BoxDecoration(
                  //     gradient: RadialGradient(
                  //         radius: 0.88,
                  //         stops: [0.1, 0.5, 0.8],
                  //         colors: [Colors.black45, Colors.black87, Colors.black])),
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: const Center(
                      child: rive.RiveAnimation.asset(
                        animations: ['hello'],
                        Assets.riveBirb,


                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        BounceInUp(
          duration: Duration(seconds: 2),
          child: GestureDetector(
            // onHover: (value) {
            //   provider.onHoverChange(value);
            // },
            onTap: () {
              Navigator.popAndPushNamed(
                  context, AppRoutes.homeRoute);
              Provider.of<HomeProvider>(context, listen: false)
                  .titleChange(0);
            },
            child: Container(
              height: 100.h,
              // width: 200.w,
              // decoration: provider.onHover == true
              //     ? UiConstant.frostedGlassDecoration()
              //     : const BoxDecoration(),
              child: Column(
                children: [
                  AnimatedTextKit(
                    repeatForever: true,
                    // pause: const Duration(milliseconds: 100),
                    isRepeatingAnimation: true,
                    animatedTexts: [
                      // FlickerAnimatedText(
                      //   'OPEN PORTFOLIO',
                      //   speed: const Duration(
                      //       milliseconds: 2600),
                      //   textAlign: TextAlign.center,
                      // ),
                      ColorizeAnimatedText(
                        "'I'm Ankit,",
                        speed: const Duration(milliseconds: 3000),

                        textStyle: TextStyle(
                            fontSize: 50.0,
                            // fontFamily: GoogleFonts.lato,
                            fontWeight: FontWeight.w900),
                        colors: [
                          Colors.white,
                          Colors.lightBlueAccent,
                          Colors.white,
                          Colors.orangeAccent.shade100,


                        ],
                      ),
                    ],
                  ),
                  "a Flutter developer passionate\nabout building exceptional apps."
                      .text
                      .textStyle(TextStyle(color: Colors.white, fontSize: 5.sp))
                      .make().expand(),
                ],
              ),
            ),
          ),
        ),
      ],

    );
  }
}
