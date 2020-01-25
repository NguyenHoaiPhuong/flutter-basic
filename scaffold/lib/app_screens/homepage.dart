import 'dart:math';

import 'package:flutter/material.dart';

class MyHomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Scaffold Header"),
        ),
        body: Material(
          color: Colors.lightBlueAccent,
          child: Center(
            child: Text(
              generateRandomNumber(),
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
              ),
            ),
          ),
        ),
      );
  }

  String generateRandomNumber() {
    var random = Random();
    var randomNumber = random.nextInt(10);

    return "Your random number is $randomNumber";
  }
}