import 'package:flutter/material.dart';
import 'package:navigator_demo/router.dart';
import 'package:navigator_demo/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Router.generateRoute,
      initialRoute: homeRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
