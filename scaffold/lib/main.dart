import 'package:flutter/material.dart';
//import 'app_screens/homepage.dart';

// First example of Scaffold
/*
void main() {
  runApp(
    MaterialApp(
      title: "My Flutter App",
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Scaffold Header"),
        ),
        body: Material(
          color: Colors.lightBlueAccent,
          child: Center(
            child: Text(
              "My Scaffold Body",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
              ),
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    )
  );
}
*/

// First example of Scaffold - Organize code
/*
void main() {
  runApp(MyFlutterApp());
}
class MyFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Flutter App",
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Scaffold Header"),
        ),
        body: Material(
          color: Colors.lightBlueAccent,
          child: Center(
            child: Text(
              "My Scaffold Body",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
              ),
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
*/

// Second example of Scaffold - Add logic
/*void main() => runApp(MyFlutterApp());
class MyFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "My Flutter App",
        home: MyHomepage(),
    );
  }
}*/

// Third example of Scaffold - State
void main() => runApp(MyFlutterApp());
class MyFlutterApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyFlutterAppState();
  }
}
class _MyFlutterAppState extends State<MyFlutterApp> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      home: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 25.0, horizontal: 10.0
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Scaffold Header"),
          ),
          body: Center(
            child: Text(
              "You have pressed the button $_count times",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            color: Colors.blue,
            child: Container(
              height: 50.0,
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => setState(() {
              _count++;
            }),
            tooltip: 'Increment Counter',
            child: Icon(Icons.add),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

