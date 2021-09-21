import 'package:flutter/material.dart';

class SidebarItem {
  String title;
  LinearGradient background;
  Icon icon;

  SidebarItem({
    required this.title,
    required this.background,
    required this.icon,
  });
}

var sidebarItems = [
  SidebarItem(
    title: 'Home',
    icon: Icon(Icons.home, color: Colors.white),
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF00AEFF),
        Color(0XFF0076FF),
      ],
    ),
  ),
  SidebarItem(
    title: 'Courses',
    icon: Icon(Icons.library_books, color: Colors.white),
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFFA7d75),
        Color(0XFFC23D61),
      ],
    ),
  ),
  SidebarItem(
    title: 'Billing',
    icon: Icon(Icons.credit_card, color: Colors.white),
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFFAD64A),
        Color(0XFFEA880F),
      ],
    ),
  ),
  SidebarItem(
    title: 'Settings',
    icon: Icon(Icons.settings, color: Colors.white),
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF4E62CC),
        Color(0XFF202A78),
      ],
    ),
  ),
];
