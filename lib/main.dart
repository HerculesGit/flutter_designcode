import 'package:flutter/material.dart';
import 'package:flutter_designcode/model/course.dart';
import 'components/cards/recent_course_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: SafeArea(
          child: Container(
            child: RecentCourseCard(
              course: recentCourses[0],
            ),
          ),
        ),
      ),
    );
  }
}
