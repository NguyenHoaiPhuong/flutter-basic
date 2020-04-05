import 'package:flutter/material.dart';

import 'homepage/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Stream Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Homepage(title: 'Flutter Stream Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}
