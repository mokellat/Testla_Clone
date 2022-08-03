import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

BottomNavigationBarItem BottomNavBarItems(String str, int index, Color primaryColor) {
  return BottomNavigationBarItem(
    backgroundColor: Colors.black,
    icon: SvgPicture.asset(
      str,
      color: primaryColor,
    ),
    label: "",
  );
}