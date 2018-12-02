import 'package:flutter/material.dart';
import 'package:music_player/my_app.dart';
import 'package:music_player/utils/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:music_player/widgets/mp_inherited.dart';

void main() => runApp(new MyMaterialApp());

class MyMaterialApp extends StatefulWidget {
  @override
  MyMaterialAppState createState() {
    return new MyMaterialAppState();
  }
}

class MyMaterialAppState extends State<MyMaterialApp> {
  String themeType;

  _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      themeType = (prefs.getString('theme') ?? 'Light Theme');
    });
  }

  @override
    void initState() {
      super.initState();
      _loadTheme();
    }

  @override
  Widget build(BuildContext context) {
    final rootTheme = MPInheritedWidget.of(context).themeType;
    return new MaterialApp(
        home: new MyApp(),
        debugShowCheckedModeBanner: false, 
        theme: rootTheme == 'lightTheme' ? lightTheme : darkTheme, 
        );
  }
}
