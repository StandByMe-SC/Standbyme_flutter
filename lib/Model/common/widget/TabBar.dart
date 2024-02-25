import 'package:flutter/material.dart';
import 'package:flutter_sc/Model/common/color.dart';
import 'package:go_router/go_router.dart';
import 'package:motion_tab_bar_v2/motion-badge.widget.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';

/// A widget representing the bottom navigation tab bar.
class TabBarBase extends StatefulWidget {
  const TabBarBase({Key? key}) : super(key: key);

  @override
  State<TabBarBase> createState() => _TabBarBaseState();
}

class _TabBarBaseState extends State<TabBarBase>
    with SingleTickerProviderStateMixin {
  MotionTabBarController? _motionTabBarController;

  // Initialize the TabBarController
  @override
  void initState() {
    super.initState();
    _motionTabBarController =
        MotionTabBarController(initialIndex: 1, length: 3, vsync: this);
  }

 // Dispose of the TabBarController
  @override
  void dispose() {
    super.dispose();
    _motionTabBarController!.dispose();
  }
@override
Widget build(BuildContext context) {
  return MotionTabBar(
    controller: _motionTabBarController,
    initialSelectedTab: "Board",
    labels: const ["Chat", "Board", "Setting"], // **Change "Chat" to "Profile"
    icons: const [
      Icons.chat,
      Icons.home,
      Icons.settings
    ], // Change Icons.chat to the profile icon

    // ignore: prefer_const_literals_to_create_immutables
    badges: [
      // Default Motion Badge Widget
      const MotionBadgeWidget(
        text: '99+', // Display a number like notifications, manage with provider for dynamic updates
        textColor: Colors.white,
        size: 18, // optional,
      ), // custom badge Widget
      Container(
        color: Colors.black,
        padding: const EdgeInsets.all(2),
        child: const Text('48',
            style: TextStyle(fontSize: 14, color: Colors.white)),
      ),

      const MotionBadgeWidget(
        isIndicator: true,
        color: Colors.red,
        size: 5,
        show: true, // true / false
      ),
    ],
    tabSize: 50,
    tabBarHeight: 55,
    textStyle: const TextStyle(
      fontSize: 12,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    tabIconColor: PRIMARYCOLOR,
    tabIconSize: 28.0,
    tabIconSelectedSize: 26.0,
    tabSelectedColor: PRIMARYCOLOR,
    tabIconSelectedColor: Colors.white,
    tabBarColor: MAIN_TEXT_COLOR,
    onTabItemSelected: (int value) {
      setState(() {
        // _tabController!.index = value;
        _motionTabBarController!.index = value;
      });
      switch (value) {
        case 0:
          {
            context.go('chat'); // Navigate to "profile"
            break;
          }
        case 1:
          {
            context.go('/');
            break;
          }
        case 2:
          {
            context.go('/settingMain');
            break;
          }
      }
    },
  );
}
}