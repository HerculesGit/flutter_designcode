import 'package:flutter/material.dart';
import 'package:flutter_designcode/constants.dart';
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
        body: Container(
          color: kBackgroundColor,
          child: SafeArea(
            child: Column(
              children: [
                HomeScreenNavBar(),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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

class HomeScreenNavBar extends StatelessWidget {
  const HomeScreenNavBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SidebarButton(),
          SearchFieldWidget(),
          Icon(
            Icons.notifications,
            color: kPrimaryLabelColor,
          ),
          SizedBox(width: 16.0),
          CircleAvatar(
            radius: 18.0,
            backgroundImage: AssetImage('asset/images/profile.jpg'),
          ),
        ],
      ),
    );
  }
}

class SearchFieldWidget extends StatelessWidget {
  SearchFieldWidget();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 12.0, right: 33.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14.0),
            boxShadow: [
              BoxShadow(
                color: kShadowColor,
                offset: Offset(0, 12),
                blurRadius: 16.0,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              cursorColor: kPrimaryLabelColor,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.search,
                  color: kPrimaryLabelColor,
                  size: 20.0,
                ),
                border: InputBorder.none,
                hintText: 'Search for courses',
                hintStyle: kSearchPlaceholderStyle,
              ),
              style: kSearchTextStyle,
              onChanged: (value) {
                print(value);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class SidebarButton extends StatelessWidget {
  SidebarButton();

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        print('sidebar pressed');
      },
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      constraints: BoxConstraints(
        maxWidth: 40.0,
        maxHeight: 40.0,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 14.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.0),
          boxShadow: [
            BoxShadow(
              color: kShadowColor,
              offset: Offset(0, 12),
              blurRadius: 16.0,
            )
          ],
        ),
        child: Image.asset(
          'asset/icons/icon-sidebar.png',
          color: kPrimaryLabelColor,
        ),
      ),
    );
  }
}
