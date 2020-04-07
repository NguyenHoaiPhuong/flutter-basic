import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigator Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen')
      ),
      body: GestureDetector(
        child: Image.network(
            'https://picsum.photos/250?image=9',
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (_) {
              return FirstScreen();
            }
          ));
        },
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: GestureDetector(
        child: Center(
          child: Image.network(
            'https://picsum.photos/250?image=9',
          ),
        ),
        onDoubleTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => SecondScreen(),
          ));
        },
      ),
    );
  }
}


class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: GestureDetector(
        child: Center(
          child: Image.network(
            'https://picsum.photos/250?image=9',
          ),
        ),
        onTap: () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
      ),
    );
  }
}