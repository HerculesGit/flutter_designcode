import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterDesign+Code',
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Container()),
    );
  }
}
