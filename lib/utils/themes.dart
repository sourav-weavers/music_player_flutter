import 'package:flutter/material.dart';

enum CurrentTheme { dark, light }


final ThemeData darkTheme = new ThemeData(
    primaryColor: Colors.black,
    primaryColorLight: Colors.grey,
    brightness: Brightness.dark,
    buttonColor: Colors.white,
    unselectedWidgetColor: Colors.white,
    primaryTextTheme:
        new TextTheme(caption: new TextStyle(color: Colors.white), headline: new TextStyle(color: Colors.black)));

final ThemeData lightTheme = new ThemeData(
    primaryColor: Colors.orange,
    primaryColorLight: Colors.white,
    backgroundColor: Colors.limeAccent[50],
    buttonColor: Colors.white,
    unselectedWidgetColor: Colors.white,
    primaryTextTheme:
        new TextTheme(caption: new TextStyle(color: Colors.white),headline: new TextStyle(color: Colors.black)));
