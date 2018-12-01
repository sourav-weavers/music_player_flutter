import 'package:music_player/pages/now_playing.dart';
import 'package:music_player/widgets/mp_inherited.dart';
import 'package:music_player/widgets/mp_lisview.dart';
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

    //Shuffle Songs and goto now playing page
    void shuffleSongs() {
      goToNowPlaying(rootIW.songData.randomSong);
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Music Player",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
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
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          children: <Widget>[
            DrawerHeader(
              child: Image.asset('assets/headphones.png',fit: BoxFit.contain),
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            ),
            ListTile(
                title: Text('Now Playing',style: TextStyle(fontWeight: FontWeight.bold),),
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
              title: Text('Settings',style: TextStyle(fontWeight: FontWeight.bold),),
              leading: Icon(Icons.settings),
              onTap: () {
                // Update the state of the app
                // ...
              },
            ),
          ],
        ),
      ),
      body: rootIW.isLoading
          ? new Center(child: new CircularProgressIndicator())
          : new Scrollbar(child: new MPListView()),
      backgroundColor: Colors.limeAccent[70],
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.shuffle),
        onPressed: () => shuffleSongs(),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
    );
  }
}