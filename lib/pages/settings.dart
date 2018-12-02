import 'package:flutter/material.dart';
import 'package:music_player/widgets/mp_settings_ui.dart';
class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Settings",
          style: TextStyle(
              color: Theme.of(context).primaryTextTheme.caption.color),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        // actions: <Widget>[
        //   new Container(
        //     padding: const EdgeInsets.all(20.0),
        //     child: new Center(
        //       child: new InkWell(
        //           child: new Text("Now Playing"),
        //           onTap: () => goToNowPlaying(
        //                 rootIW.songData.songs[
        //                     (rootIW.songData.currentIndex == null ||
        //                             rootIW.songData.currentIndex < 0)
        //                         ? 0
        //                         : rootIW.songData.currentIndex],
        //                 nowPlayTap: true,
        //               )),
        //     ),
        //   )
        // ],
      ),      
      body: new Container(
        child: new MPSettingsView(),
      ),
      backgroundColor: Theme.of(context).primaryColorLight,
    );
  }
}
