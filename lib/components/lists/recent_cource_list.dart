import 'package:flutter/material.dart';
import '/components/cards/recent_course_card.dart';
import '/model/course.dart';

class RecentCourseList extends StatefulWidget {
  const RecentCourseList({Key? key}) : super(key: key);

  @override
  _RecentCourseListState createState() => _RecentCourseListState();
}

class _RecentCourseListState extends State<RecentCourseList> {
  List<Container> indicatiors = [];
  int currentPage = 0;

  Widget updateIndicators() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: recentCourses.map(
          (course) {
            var index = recentCourses.indexOf(course);

            return Container(
              height: 7.0,
              width: 7.0,
              margin: EdgeInsets.symmetric(horizontal: 6.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isCurrentCard(index)
                    ? Color(0xFF0971FE)
                    : Color(0xFFA6AEBD),
              ),
            );
          },
        ).toList());
  }

  bool isCurrentCard(int index) => currentPage == index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 320,
          width: double.infinity,
          child: PageView.builder(
            onPageChanged: (index) => setState(() => {currentPage = index}),
            itemCount: recentCourses.length,
            controller: PageController(
              initialPage: 0,
              // eliminate the space between recents card
              // Possible it generate a 'pow effect'.
              // In emulator the padding/width between cards didn't look good
              viewportFraction: 0.63,
            ),
            itemBuilder: (context, index) {
              return Opacity(
                  // The bealtiful opacity!!!!!!!!
                  opacity: isCurrentCard(index) ? 1.0 : 0.5,
                  child: RecentCourseCard(course: recentCourses[index]));
            },
          ),
        ),
        updateIndicators(),
      ],
    );
  }
}
