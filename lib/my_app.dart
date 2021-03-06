import 'package:music_player/data/song_data.dart';
import 'package:music_player/pages/root_page.dart';
import 'package:music_player/widgets/mp_inherited.dart';
import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/utils/themes.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SongData songData;
  bool _isLoading = true;
  ThemeData themeType = lightTheme;


  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  void dispose() {
    super.dispose();
    songData.audioPlayer.stop();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  initPlatformState() async {
    _isLoading = true;

    var songs;
    try {
      songs = await MusicFinder.allSongs();
    } catch (e) {
      print("Failed to get songs: '${e.message}'.");
    }

    print(songs);
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      songData = new SongData((songs));
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print('from my_app '+ themeType);
    return new MPInheritedWidget(songData, _isLoading, themeType, new RootPage());
  }
}
