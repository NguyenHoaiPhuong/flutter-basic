import 'package:flutter/material.dart';
import 'package:navigator_demo/views/home.dart';
import 'package:navigator_demo/views/feed.dart';

const String homeRoute = '/';
const String feedRoute = 'feed';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => Home());
      case feedRoute:
        var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => Feed(data));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}