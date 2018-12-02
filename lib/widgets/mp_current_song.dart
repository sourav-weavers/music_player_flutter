import 'dart:io';
import 'package:music_player/data/song_data.dart';
import 'package:music_player/pages/now_playing.dart';
import 'package:music_player/widgets/mp_circle_avatar.dart';
import 'package:flute_music_player/flute_music_player.dart';
import 'package:music_player/widgets/mp_inherited.dart';
import 'package:flutter/material.dart';

class MPCurrentSong extends StatelessWidget {
  // final List<MaterialColor> _colors = Colors.primaries;
  bool playing = true;
  @override
  Widget build(BuildContext context) {
    final rootIW = MPInheritedWidget.of(context);

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

    SongData songData = rootIW.songData;
    int currentIndex = (rootIW.songData.currentIndex == null ||rootIW.songData.currentIndex < 0)? 0: rootIW.songData.currentIndex;
    final artImg = songData.songs[currentIndex].albumArt == null ? null : songData.songs[currentIndex].albumArt;
    final audioPlayer = songData.audioPlayer;
    Future play(Song s) async {
    if (s != null) {
      final result = await audioPlayer.play(s.uri, isLocal: true);
    }
  }

  Future pause() async {
    final result = await audioPlayer.pause();
  }
    return new InkWell(
      onTap: () => goToNowPlaying(
            songData.songs[(songData.currentIndex == null ||
                    songData.currentIndex < 0)
                ? 0
                : songData.currentIndex],
            nowPlayTap: true,
          ),
      child: new Container(
        padding: const EdgeInsets.all(4.0),
        height: 40,
        child: Row(
          children: [
            artImg == null?new Image(image: AssetImage('assets/music_icon.png'),gaplessPlayback: false,height: 40,width: 40,fit: BoxFit.cover,):new Image(image: FileImage(new File.fromUri(Uri.parse(artImg))),gaplessPlayback: false,height: 40,width: 40,fit: BoxFit.cover,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  new Container(
                    padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                    alignment: Alignment.center,
                    child: Text(
                      songData
                          .songs[(rootIW.songData.currentIndex == null ||
                                  rootIW.songData.currentIndex < 0)
                              ? 0
                              : rootIW.songData.currentIndex]
                          .title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  new Container(
                    alignment: Alignment.center,
                    child: Text(
                      songData.songs[(rootIW.songData.currentIndex == null ||rootIW.songData.currentIndex < 0)? 0: rootIW.songData.currentIndex].artist + ', ' + songData.songs[(rootIW.songData.currentIndex == null ||rootIW.songData.currentIndex < 0)? 0: rootIW.songData.currentIndex].album,
                      style: TextStyle(
                         color: Colors.grey[500],
                        
                      ),
                    ),
                  ),
                ],
              ),
            ),
            new InkWell(
              onTap: () {
                if(this.playing){
                  pause();
                  this.playing=false;
                }
                else{
                  play(songData.songs[currentIndex]);
                  this.playing =true;
                }
              } ,
              child: new Icon(
              this.playing?Icons.pause:Icons.play_arrow,
              size: 40,
              color: Colors.black,
            ),
            )
          ],
        ),
      ),
    );
  }
}
