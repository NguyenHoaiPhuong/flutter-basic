import 'package:flutter/material.dart';

class Feed extends StatelessWidget {

  final String data;

  Feed(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Feed: $data')),
    );
  }
}