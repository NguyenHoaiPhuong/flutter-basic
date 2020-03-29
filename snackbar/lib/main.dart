// Snackbar is for someone whoever wants to show a quick msg
// for few seconds at the bottom of our screen in our app

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snack Bar Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Snack Bar Demo'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(this.title),
      body: MyAppBody(),
    );
  }
}

class MyAppBar extends AppBar {
  MyAppBar(String title) : super(title: Text(title));
}

class MyAppBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          simpleSnackbar(context),
          coloredSnackbar(context),
          imageSnackbar(context),
        ],
      ),
    );  
  }
}

FlatButton simpleSnackbar(BuildContext context) {
  String title = "Simple Snackbar";
  return FlatButton(
    child: Text(
      title,
      style: TextStyle(
        color: Colors.blue,
        fontSize: 16.0,
      ),
    ),
    onPressed: () {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(title),
          duration: Duration(milliseconds: 1000),
        )
      );
    },
  );
}

FlatButton coloredSnackbar(BuildContext context) {
  String title = "Colored Snackbar";
  return FlatButton(
    child: Text(
      title,
      style: TextStyle(
        color: Colors.blue,
        fontSize: 16.0,
      ),
    ),
    onPressed: () {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(
            title,
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          backgroundColor: Colors.lightGreenAccent,
          duration: Duration(milliseconds: 2000),
        )
      );
    },
  );
}

FlatButton imageSnackbar(BuildContext context) {
  String title = "Snackbar with image";
  return FlatButton(
    child: Text(
      title,
      style: TextStyle(
        color: Colors.blue,
        fontSize: 16.0,
      ),
    ),
    onPressed: () {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: <Widget>[
              Icon(
                Icons.favorite,
                color: Colors.deepPurple,
              ),
              Text(
                title,
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ],
          ),
          backgroundColor: Colors.limeAccent,
          duration: Duration(milliseconds: 3000),
        )
      );
    },
  );
}