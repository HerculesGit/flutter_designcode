import 'package:flutter/material.dart';
import 'package:flutter_designcode/components/home_screen_navbar.dart';
import 'package:flutter_designcode/constants.dart';
import 'package:flutter_designcode/screens/sidebar_screen.dart';
import 'components/lists/explore_course_list.dart';
import 'components/lists/recent_cource_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

// For animation using with mixin
class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late Animation<Offset> sidebarAnimation;
  late AnimationController sidebarAnimationController;

  @override
  void initState() {
    super.initState();

    sidebarAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );

    sidebarAnimation = Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: sidebarAnimationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        child: Stack(
          children: [
            SafeArea(
              child: Column(
                children: [
                  HomeScreenNavBar(
                    triggerAnimation: () {
                      sidebarAnimationController.forward();
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Recents', style: kLargeTitleStyle),
                        Text('23 courses, more coming', style: kSubtitleStyle),
                        SizedBox(height: 5.0),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  RecentCourseList(),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 25.0, bottom: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Explore',
                          style: kTitle1Style,
                        ),
                      ],
                    ),
                  ),
                  ExploreCourseList(),
                ],
              ),
            ),
            SlideTransition(
              position: sidebarAnimation,
              child: SafeArea(
                bottom: false,
                child: SidebarScreen(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
