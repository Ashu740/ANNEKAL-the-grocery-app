// ignore_for_file: deprecated_member_use, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class Mytheme {
  static ThemeData lighttheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.indigo,
      indicatorColor: Vx.blue900,
      cardColor: Colors.white,
      dividerColor: Vx.gray200,
      focusColor: Colors.black,
      canvasColor: cream,
      fontFamily: GoogleFonts.lexendDeca().fontFamily,
      // ignore: duplicate_ignore
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Mytheme.cream,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.white),
        color: Mytheme.cream,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        // ignore: deprecated_member_use
        toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
        // ignore: deprecated_member_use
        titleTextStyle: Theme.of(context).textTheme.headline6,
      ));

  static ThemeData darktheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.blue,
      dividerColor: const Color(0xff22222C),
      cardColor: const Color(0xff22222C),
      hintColor: const Color.fromARGB(149, 209, 213, 219),
      indicatorColor: const Color(0xffA8C5FD),
      focusColor: Colors.white,
      canvasColor: darkcream,
      fontFamily: GoogleFonts.lexendDeca().fontFamily,
      appBarTheme: AppBarTheme(
        backgroundColor: darkcream,
        foregroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: darkcream,
          systemNavigationBarColor: const Color(0xff22222C),
        ),
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.white12),
        toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
        titleTextStyle: Theme.of(context).textTheme.headline6,
      ));
  static Color cream = const Color(0xfff5f5f5);
  static Color darkcream = const Color(0xff1B1C20);
  static Color darkblue = Vx.blue400;
  static Color whiteee = Colors.white;
  static Color blackkk = Colors.black;
  static Color gr1 = const Color.fromARGB(134, 88, 226, 111);
  static Color gr2 = const Color.fromARGB(116, 219, 242, 11);
}
