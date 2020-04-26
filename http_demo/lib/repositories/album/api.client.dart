import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_demo/models/models.dart';

class AlbumAPIClient {
  final _baseURL = 'https://jsonplaceholder.typicode.com';

  Future<Album> fetchAlbum() async {
    final url = _baseURL + '/albums/1';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<List<Album>> listAlbums() async {
    final url = _baseURL + '/albums';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((album) => new Album.fromJson(album)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load all albums');
    }
  }
}