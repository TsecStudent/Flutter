import 'package:flutter/material.dart';

void main() => runApp(SongListApp());

class SongListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Songs List',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: SongListScreen(),
    );
  }
}

class Song {
  final String title;
  final String artist;
  final String album;
  final String duration;

  Song({required this.title, required this.artist, required this.album, required this.duration});
}

class SongListScreen extends StatelessWidget {
  final List<Song> songs = [
    Song(title: 'Blinding Lights', artist: 'The Weeknd', album: 'After Hours', duration: '3:20'),
    Song(title: 'Watermelon Sugar', artist: 'Harry Styles', album: 'Fine Line', duration: '2:54'),
    Song(title: 'Levitating', artist: 'Dua Lipa', album: 'Future Nostalgia', duration: '3:23'),
    Song(title: 'Peaches', artist: 'Justin Bieber', album: 'Justice', duration: '3:18'),
    Song(title: 'Bad Habits', artist: 'Ed Sheeran', album: '=', duration: '3:51'),
    Song(title: 'Save Your Tears', artist: 'The Weeknd', album: 'After Hours', duration: '3:35'),
    Song(title: 'Easy On Me', artist: 'Adele', album: '30', duration: '3:45'),
    Song(title: 'Shivers', artist: 'Ed Sheeran', album: '=', duration: '3:27'),
    Song(title: 'As It Was', artist: 'Harry Styles', album: 'Harry’s House', duration: '2:47'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Top Songs')),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          final song = songs[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            elevation: 3,
            child: ListTile(
              leading: Icon(Icons.music_note, color: Colors.deepPurple),
              title: Text(song.title, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${song.artist} • ${song.album}'),
              trailing: Text(song.duration),
            ),
          );
        },
      ),
    );
  }
}
