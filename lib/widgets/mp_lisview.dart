import 'dart:io';
import 'package:music_player/data/song_data.dart';
import 'package:music_player/pages/now_playing.dart';
import 'package:music_player/widgets/mp_circle_avatar.dart';
import 'package:music_player/widgets/mp_inherited.dart';
import 'package:flutter/material.dart';

class MPListView extends StatelessWidget {
  final List<MaterialColor> _colors = Colors.primaries;
  @override
  Widget build(BuildContext context) {
    final rootIW = MPInheritedWidget.of(context);
    SongData songData = rootIW.songData;
    return new ListView.builder(
      itemCount: songData.songs.length,
      itemBuilder: (context, int index) {
        var s = songData.songs[index];
        final MaterialColor color = _colors[index % _colors.length];
        var artFile =
            s.albumArt == null ? null : new File.fromUri(Uri.parse(s.albumArt));
        return new ListTile(
          dense: false,
          leading: new ClipOval(
            child: artFile == null ?Image.network(
              "http://www.scottishculture.org/themes/scottishculture/images/music_placeholder.png",
              fit: BoxFit.cover,
              width: 40.0,
              height: 40.0,
            )
            : Image.file(artFile,fit: BoxFit.cover, width: 40.0, height: 40.0,)
          ),
          // CircleAvatar(
          //  backgroundImage: NetworkImage('http://www.scottishculture.org/themes/scottishculture/images/music_placeholder.png'),
          // ),
          title: new Text(s.title),
          subtitle: new Text(
            "By ${s.artist}",
            style: Theme.of(context).textTheme.caption,
          ),
          onTap: () {
            songData.setCurrentIndex(index);
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new NowPlaying(songData, s)));
          },
        );
      },
    );
  }
}
