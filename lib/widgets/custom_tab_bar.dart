
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomTabBar extends StatefulWidget {
  final String? screen1Title;
  final String? screen2Title;
  final String? screen3Title;
  final Widget? screen1;
  final Widget? screen2;
  final Widget? screen3;
  final Function(int? value)? onTap;
  final int? initialIndex;

  const CustomTabBar(
      {Key? key,
      required this.screen1Title,
      required this.screen2Title,
      required this.screen1,
      required this.screen2,
      this.initialIndex,
      this.screen3Title,
      this.screen3, this.onTap})
      : super(key: key);

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {

    _tabController = TabController(
        length: 3, vsync: this, initialIndex: widget.initialIndex ?? 0);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: DefaultTabController(
            length: 3,
            initialIndex: 0,

            animationDuration: const Duration(microseconds: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ButtonsTabBar(
                  buttonMargin: EdgeInsets.zero,
                  backgroundColor: Colors.black54,
                  unselectedBackgroundColor: Colors.transparent,
                  splashColor: Colors.black54,
                  radius: 0,
                  onTap: widget.onTap,
                  height: 30,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
                  unselectedLabelStyle: const TextStyle(color: Colors.white),
                  labelStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  tabs:  [
                    Tab(
                      text: widget.screen1Title,
                    ),
                    Tab(
                      text: widget.screen2Title,
                    ),
                    Tab(
                      text: widget.screen3Title,
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      widget.screen1!,
                      widget.screen2!,
                      widget.screen3!
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // give the tab bar a height [can change height to preferred height]
        // Container(
        //   height: 50,
        //   decoration: BoxDecoration(
        //     color: Colors.transparent,
        //     borderRadius: BorderRadius.circular(
        //       8.0,
        //     ),
        //   ),
        //   child: TabBar(
        //     padding: EdgeInsets.zero,
        //     controller: _tabController,
        //     labelPadding: EdgeInsets.zero,
        //     // give the indicator a decoration (color and border radius)
        //     indicator: BoxDecoration(
        //       boxShadow: const [
        //         BoxShadow(
        //             spreadRadius: 1,
        //             blurRadius: 3,
        //             offset: Offset(0.0, 2.0),
        //             color: Colors.black12)
        //       ],
        //       borderRadius: BorderRadius.circular(
        //         8.0,
        //       ),
        //       color: Colors.black54,
        //     ),
        //
        //     labelColor: Colors.white,
        //     unselectedLabelColor: Colors.white,
        //     tabs: [
        //       // first tab [you can add an icon using the icon property]
        //       Tab(
        //         text: widget.screen1Title,
        //       ),
        //       // second tab [you can add an icon using the icon property]
        //       Tab(
        //         text: widget.screen2Title,
        //       ),
        //       Tab(
        //         text: widget.screen3Title,
        //       ),
        //     ],
        //   ),
        // ),
        // // tab bar view here
        // Container(
        //   height: 300,
        //   child: TabBarView(
        //     physics: const NeverScrollableScrollPhysics(),
        //     controller: _tabController,
        //     children: [
        //       // first tab bar view widget
        //       widget.screen1!,
        //       // second tab bar view widget
        //       widget.screen2!,
        //       widget.screen3!
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
