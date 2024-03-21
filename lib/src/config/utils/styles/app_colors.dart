import 'package:flutter/material.dart';

abstract class AppColors {
  static Color white = const Color(0xffffffff);
  static Color grey = const Color(0xffAAAAAA); //#AAAAAA
  static Color greyDark = const Color(0xff898989);
  static Color primaryOrange = const Color(0xffB77F58); // #B77F58

  static Color lowPriority = const Color(0xff848191);
  static Color primaryColor = const Color(0xff6F5D51); //#6F5D51
  static Color primaryDark = const Color(0x991F1513); //#1F1513
  static Color secondaryColor = const Color(0xff6F5D51); //#6F5D51
  static Color darkColor = const Color(0xff3d3530);
  static Color scaffoldColor = const Color(0xff785D48);
  static Color appBarColor = const Color(0xffffffff);
  static Color primaryLight = const Color(0xff8D705C); //#8D705C
  static Color greenColor = const Color(0xf461df25);
  static Color blueColor = const Color(0xf42550df);
  static Color redColor = const Color(0xf4df2535);
  static Color blackColor = const Color(0xf4000000);
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
