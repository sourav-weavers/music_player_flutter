import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:music_player/main.dart';

class MPSettingsView extends StatefulWidget {
  // const YellowBird({ Key key }) : super(key: key);
  @override
  _MPSettingsState createState() => _MPSettingsState();
}

class _MPSettingsState extends State<MPSettingsView> {
  
  String themeType;

  void updateTheme(type) {
    _setTheme(type);
    themeType = type;
    setState(() {
      
    });
    // print(this.themeType);
  }

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      themeType = (prefs.getString('theme') ?? 'Light Theme');
    });
  }

  _setTheme(type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('theme', type);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        return new ListTile(
          title: new Text("Change Theme Color"),
          onTap: () {},
          trailing: new DropdownButton<String>(
            value: themeType ?? 'Light Theme',
            hint: new Text('Select a Theme'),
            // value: this.themeType,
            items: <String>['Light Theme', 'Dark Theme'].map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList(),
            onChanged: (_) {updateTheme(_);},
          ),
        );
      },
    );
  }
}
