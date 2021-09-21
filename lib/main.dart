import 'package:flutter/material.dart';

import 'components/sidebar_row.dart';
import 'model/sidebar.dart';

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
        body: Center(
          child: SidebarRow(
            item: sidebarItems[0],
          ),
        ),
      ),
    );
  }
}
