import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http_demo/models/models.dart';
import 'package:http_demo/repositories/album/api.client.dart';

class Homepage extends StatefulWidget {
  Homepage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final albumAPI = AlbumAPIClient();
  Future<Album> futureAlbum;
  Future<List<Album>> futureAlbums;

  @override
  void initState() {
    super.initState();
    futureAlbum = albumAPI.fetchAlbum();
    futureAlbums = albumAPI.listAlbums();
  }

  FutureBuilder<Album> buildAlbum() {
    return FutureBuilder<Album>(
      future: futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data.title);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }

  FutureBuilder<List<Album>> buildAlbums() {
    return FutureBuilder<List<Album>>(
      future: futureAlbums,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Album> albums = snapshot.data;
          return ListView.builder(
            itemCount: albums.length,
            itemBuilder: (context, index) {
              return _listTile(albums[index]);
            },
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }

  ListTile _listTile(Album album) {
    return ListTile(
      leading: Text(
        'Album ID : ${album.id}',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.black,
        ),
      ),
      title: Text(
        album.title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: Colors.blue,
        )
      ),
      subtitle: Text(
        'User ID : ${album.userId}',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: buildAlbums(),
      ),
    );
  }
}