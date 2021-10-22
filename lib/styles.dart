import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

ThemeData mainTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
// In AppBar only.
    iconTheme: IconThemeData(color: Colors.black),
  ),
// In all app without AppBar.
  iconTheme: const IconThemeData(color: Colors.black),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Color(0xfffef9fb),
    unselectedItemColor: Colors.grey,
    selectedIconTheme: IconThemeData(size: 33.0),
    unselectedIconTheme: IconThemeData(size: 24.0),
    selectedLabelStyle: TextStyle(fontSize: 15.0),
    unselectedLabelStyle: TextStyle(fontSize: 12.0),
    elevation: 20.0,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 16.0,
      color: MyColors.firstColor,
      fontFamily: 'CairoRegular',
    ),
    bodyText2: TextStyle(
      fontSize: 18.0,
      color: MyColors.firstColor,
      fontFamily: 'CairoBold',
    ),
    subtitle1: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      fontFamily: 'CairoSemiBold',
    ),
    subtitle2: TextStyle(
      fontSize: 24.0,
      fontFamily: 'CairoSemiBold',
    ),
    headline5: TextStyle(
      fontSize: 22.0,
      letterSpacing: 1.5,
      fontFamily: 'CairoSemiBold',
    ),
    headline6: TextStyle(
      fontSize: 25.0,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.5,
      fontFamily: 'CairoBold',
    ),
  ),
);
