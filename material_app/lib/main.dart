import 'package:flutter/material.dart';

void main() => runApp(LMaterialApp());

class LMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: Theme
              .of(context)
              .accentColor
              .withOpacity(0.5),
          appBar: AppBar(
            backgroundColor: Theme
                .of(context)
                .primaryColor,
            title: const Text(
                'Material App',
                style: TextStyle(
                  color: Colors.white,
                ),
            ),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Text(
                'A convenience widget that wraps a number of widgets that are commonly required for applications implementing Material Design',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
