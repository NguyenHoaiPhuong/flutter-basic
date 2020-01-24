import 'package:flutter/material.dart';

/*void main() {
  runApp(
    Center(
      child: Text(
        "Hello Flutter",
        textDirection: TextDirection.ltr,
      ),
    ),
  );
}*/

void main() {
  runApp(
    MaterialApp(
      title: "My Flutter app",
      home: Material(
        color: Colors.lightBlueAccent,
        child: Center(
          child: Text(
            "Hello Flutter",
            textDirection: TextDirection.ltr,
            style: TextStyle(
              color: Colors.white,
              fontSize: 40.0,
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

/*void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World Demo Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Home page'),
    );
  }
}*/

// 1st example: basic widget Text
/*class MyHomePage extends StatelessWidget {
  // Constructor
  MyHomePage({Key key, this.title}) : super(key: key);

  // Variable
  final String title;

  // Function
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Hello World',
        style: TextStyle(
            backgroundColor: Colors.green,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}*/

// 2nd example: basic widget Text
/*class MyHomePage extends StatelessWidget {
  // Constructor
  MyHomePage({Key key, this.title}) : super(key: key);

  // Variable
  final String title;

  // Function
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          children: <TextSpan>[
            TextSpan(
                text: "Hello ",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.blue,
                )
            ),
            TextSpan(
                text: "World",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                )
            ),
          ],
        ),
      ),
    );
  }
}*/

// 3rd example: basic widget Text
/*class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
          child:
          Text(
            'Hello World',
          )
      ),
    );
  }
}*/

// 4th example: basic widget Image
/*class MyHomePage extends StatelessWidget {
  // constructor
  MyHomePage({Key key, this.title}) : super(key: key);

  // Variable
  final String title;

  // Function
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image.asset('assets/smiley.jpeg'),
    );
  }
}*/

// 5th example: basic widget Icon
/*class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.title),),
      body: Center( child: Icon(Icons.email)),
    );
  }
}*/