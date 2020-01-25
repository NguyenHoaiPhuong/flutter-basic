import 'package:flutter/material.dart';
import 'app_screens/homepage.dart';

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

void main() => runApp(MyFlutterApp());

class MyFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "My Flutter App",
        home: MyHomepage(),
    );
  }
}


/*
void main() => runApp(MyScaffoldWidget());

class MyScaffoldWidget extends StatefulWidget {
  @override
  _MyScaffoldWidgetState createState() => _MyScaffoldWidgetState();
}

class _MyScaffoldWidgetState extends State<MyScaffoldWidget> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Scaffold'),
        ),
        body: Center(
          child: Text('You have pressed the button $_count times.'),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
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
    );
  }
}
*/