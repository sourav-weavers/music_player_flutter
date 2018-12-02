import 'package:music_player/pages/now_playing.dart';
import 'package:music_player/pages/settings.dart';
import 'package:music_player/widgets/mp_inherited.dart';
import 'package:music_player/widgets/mp_lisview.dart';
import 'package:music_player/widgets/mp_current_song.dart';
import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rootIW = MPInheritedWidget.of(context);
    //Goto Now Playing Page
    void goToNowPlaying(Song s, {bool nowPlayTap: false}) {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => new NowPlaying(
                    rootIW.songData,
                    s,
                    nowPlayTap: nowPlayTap,
                  )));
    }
    //GoTo Settings Page
    void goToSettings(){
       Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => 
                new Settings()
              ));
    }
    //Shuffle Songs and goto now playing page
    void shuffleSongs() {
      goToNowPlaying(rootIW.songData.randomSong);
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Music Player",
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
      // drawer: new MPDrawer(),
      drawer: Drawer(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            children: <Widget>[
              DrawerHeader(
                child:
                    Image.asset('assets/LiteCover.png', fit: BoxFit.fill),
                padding: EdgeInsets.all(0.0),
              ),
              ListTile(
                  title: Text(
                    'Now Playing',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: Icon(Icons.play_arrow),
                  onTap: () => goToNowPlaying(
                        rootIW.songData.songs[
                            (rootIW.songData.currentIndex == null ||
                                    rootIW.songData.currentIndex < 0)
                                ? 0
                                : rootIW.songData.currentIndex],
                        nowPlayTap: true,
                      )),
              ListTile(
                title: Text(
                  'Settings',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Icon(Icons.settings),
                onTap: () {
                  // Update the state of the app
                  // ...
                  goToSettings();
                },
              ),
            ],
          ),
        ),
      ),
      body: rootIW.isLoading
          ? new Center(child: new CircularProgressIndicator())
          : new Scrollbar(child: new MPListView()),
      backgroundColor: Theme.of(context).primaryColorLight,
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.shuffle),
        onPressed: () => shuffleSongs(),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).buttonColor,
      ),
      bottomNavigationBar: rootIW.isLoading
          ? null
          : rootIW.songData.currentIndex == null ||
                  rootIW.songData.currentIndex < 0
              ? null
              : new Container(
                  decoration:
                      new BoxDecoration(color: Colors.white, boxShadow: [
                    new BoxShadow(
                      color: Colors.black,
                      blurRadius: 20.0,
                    ),
                  ]),
                  child: new MPCurrentSong(),
                  height: 60,
                ),
    );
  }
}
