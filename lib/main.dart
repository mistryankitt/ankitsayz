import 'dart:developer';
import 'dart:ui';

import 'package:ankitsayz/generated/assets.dart';
import 'package:ankitsayz/multi_provider.dart';
import 'package:ankitsayz/routes/routes.dart';
import 'package:ankitsayz/screen/about/view.dart';
import 'package:ankitsayz/screen/experience/view.dart';
import 'package:ankitsayz/screen/home/provider.dart';
import 'package:ankitsayz/screen/home/view.dart';
import 'package:ankitsayz/screen/projects/view.dart';
import 'package:ankitsayz/screen/welcome/view.dart';
import 'package:ankitsayz/utils/const.dart';
import 'package:ankitsayz/utils/ui_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProviderGet(
          child: Consumer<HomeProvider>(
            builder: (context, provider, child) {
              return MaterialApp(
                title: "${provider.pageName} - ${Constant.appName}",
                debugShowCheckedModeBanner: false,
                key: navigatorKey,
                // home: HomePage(),
                onGenerateRoute: AppRoutes.generateRoutes,
                theme: ThemeData(
                  useMaterial3: false,
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class FinalView extends StatefulWidget {
  const FinalView({Key? key}) : super(key: key);

  @override
  _FinalViewState createState() => _FinalViewState();
}

class _FinalViewState extends State<FinalView>
    with SingleTickerProviderStateMixin {
  /// Categories keys
  final List<GlobalKey> tabsCategories = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  TabController? tabController;

  /// Scroll Controller
  late ScrollController scrollController;

  /// Tab Context
  BuildContext? tabContext;

  @override
  void initState() {
    scrollController = ScrollController();

    // tabController = TabController(length: 4, vsync: this);
    // tabController?.addListener(() {
    //   scrollController.addListener(animateToTab);
    //
    // });
    scrollController.addListener(animateToTab);
    super.initState();
  }

  /// Animate To Tab
  void animateToTab() {
    late RenderBox box;
    for (var i = 0; i < tabsCategories.length; i++) {
      box = tabsCategories[i].currentContext!.findRenderObject()
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

  /// Scroll to Index
  void scrollToIndex(int index) async {
    scrollController.removeListener(animateToTab);
    final categories = tabsCategories[index].currentContext!;
    await Scrollable.ensureVisible(
      categories,
      duration: const Duration(milliseconds: 600),
    );
    scrollController.addListener(animateToTab);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
        overlays: []);

    return DefaultTabController(
      length: 4,
      child: Builder(
        builder: (BuildContext context) {
          tabContext = context;
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Container(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              color: Colors.transparent,
              child: Stack(
                children: [
                  CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      SliverAppBar(
                        backgroundColor: Colors.transparent,
                        expandedHeight: 600.h,
                        foregroundColor: Colors.transparent,
                        scrolledUnderElevation: 0,
                        stretch: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),

                        // bottom:        ,

                        flexibleSpace: FlexibleSpaceBar(
                          centerTitle: true,
                          titlePadding: EdgeInsets.zero,
                          title: Container(
                            // width: MediaQuery.sizeOf(context).width * 0.40,
                            height: MediaQuery.sizeOf(context).height * 0.05,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade800,
                                borderRadius: BorderRadius.circular(20)),
                            child: TabBar(
                              controller: tabController,
                              padding: EdgeInsets.zero,
                              dividerColor: Colors.transparent,
                              isScrollable: true,
                              labelColor: Colors.white,
                              indicator: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Colors.blue,
                                  Colors.white,
                                ]),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              indicatorWeight: 0.1,
                              indicatorSize: TabBarIndicatorSize.tab,
                              tabs: [
                                Tab(child: UiConstant.normalText("About", 12)),
                                Tab(child: UiConstant.normalText("Experience", 12)),
                                Tab(child: UiConstant.normalText("Projects", 12)),
                                Tab(child: UiConstant.normalText("Contact", 12)),

                              ],
                              onTap: (int index) => scrollToIndex(index),
                            ),
                          ),
                          background: WelcomePage(),
                        ),
                        pinned: true,
                        elevation: 0,
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 80.0),
                          child: Column(
                            children: [
                              /// aboutPage
                              _buildCategoryTitle('', 0),
                              _buildItemList(PortfolioPagesList.aboutPage),

                              /// experiencePage
                              _buildCategoryTitle('', 1),
                              _buildItemList(PortfolioPagesList.experiencePage),

                              /// projectPage  - Content
                              _buildCategoryTitle('', 2),
                              _buildItemList(PortfolioPagesList.projectPage),

                              /// contactPage  - Content
                              _buildCategoryTitle('', 3),
                              _buildItemList(PortfolioPagesList.contactPage),

                              /// Empty Bottom space
                              const SizedBox(
                                height: 30,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// Item Lists
  Widget _buildItemList(List<Widget> categories) {
    return Column(
      children: categories.map((m3) => _buildSingleItem(m3)).toList(),
    );
  }

  /// Single Product item widget
  Widget _buildSingleItem(Widget item) {
    return Column(
      children: [
        item,
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  /// Category Title
  Widget _buildCategoryTitle(String title, int index) {
    return Padding(
      key: tabsCategories[index],
      padding: const EdgeInsets.only(top: 14, right: 12, left: 12),
    );
  }
}

class PortfolioPagesList {
  /// aboutPage
  static List<Widget> aboutPage = [AboutMePage()];

  /// experiencePage
  static List<Widget> experiencePage = [ExperiencePage()];

  /// contactPage
  static List<Widget> contactPage = [AboutMePage()];

  /// projectPage

  static List<Widget> projectPage = [ProjectsPage()];
}

class GradientCursorDemo extends StatefulWidget {
  @override
  _GradientCursorDemoState createState() => _GradientCursorDemoState();
}

class _GradientCursorDemoState extends State<GradientCursorDemo> {
  Offset _position = Offset(0, 0);

  void _updatePosition(PointerEvent event) {
    setState(() {
      _position = event.position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: _updatePosition,
      child: Stack(
        children: [
          Container(
            color: Colors.black, // Background color
            // child: Lottie.asset("assets/lottie/blur.json", ),
            // Add your other content here
          ),
          Positioned(
            left: _position.dx - 250, // Adjust to center the gradient on cursor
            top: _position.dy - 200, // Adjust to center the gradient on cursor
            child: Container(
                child: Image.asset(
              Assets.imagesBlurCircle,
              fit: BoxFit.contain,
              height: 500,
              color: Colors.white12,
              width: 500,
            )),
          ),
          FinalView(),
        ],
      ),
    );
  }
}
