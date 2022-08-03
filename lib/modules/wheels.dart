import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

List<Widget> WheelsVis(var context) {
  return [
    Positioned(
      top: 180,
      left: 100,
      child: SvgPicture.asset("assets/icons/FL_Tyre.svg"),
    ),
    Positioned(
      top: 180,
      left: MediaQuery.of(context).size.width / 2 + 72,
      child: SvgPicture.asset("assets/icons/FL_Tyre.svg"),
    ),
    Positioned(
      top: MediaQuery.of(context).size.height / 1.7,
      left: 100,
      child: SvgPicture.asset("assets/icons/FL_Tyre.svg"),
    ),
    Positioned(
      top: MediaQuery.of(context).size.height / 1.7,
      left: MediaQuery.of(context).size.width / 2 + 72,
      child: SvgPicture.asset("assets/icons/FL_Tyre.svg"),
    ),
  ];
}
