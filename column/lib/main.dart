import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Column Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Home Page'),
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
      appBar: AppBar(
        title: Text(
          "Flutter Column demo",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "This is the column Widget - Item 1",
            style: TextStyle(fontSize: 18.0),
          ),
          Image.asset(
            "assets/flutter-logo.png",
            fit: BoxFit.fitWidth,
          ),
          Text(
            "This is the column Widget - Item 2",
            style: TextStyle(fontSize: 18.0),
          ),
          Text(
            "This is the column Widget - Item 3",
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      )
    );
  }
}

enum ALIGN {
  evenly,
  start,
  end
}

class HomePage extends StatefulWidget {
  HomePage({this.title});

  final String title;

  @override
  _HomePageState createState() => _HomePageState();    
}

class _HomePageState extends State<HomePage> {
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.spaceEvenly;
  ALIGN _character = ALIGN.evenly;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Page",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
          ),
        ),
      ),
      body: Column(        
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: _mainAxisAlignment,
              children: <Widget>[
                Text(
                  "This is the column widget - Item 1",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black
                  ),
                ),
                Text(
                  "This is the column widget - Item 2",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.green
                  ),
                ),
                Image.asset("assets/flutter-logo.png"),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.lightGreen,
            ),
            child: Row(
              children: <Widget>[
                Radio(
                  value: ALIGN.evenly,
                  groupValue: _character,
                  onChanged: (ALIGN value) {
                    setState(() {
                      _character = value;
                      _mainAxisAlignment = MainAxisAlignment.spaceEvenly;
                    });                    
                  },
                ),
                Text("Evenly"),

                Radio(
                  value: ALIGN.start,
                  groupValue: _character,
                  onChanged: (ALIGN value) {
                    setState(() {
                      _character = value;
                      _mainAxisAlignment = MainAxisAlignment.start;
                    });                    
                  },
                ),
                Text("Start"),

                Radio(
                  value: ALIGN.end,
                  groupValue: _character,
                  onChanged: (ALIGN value) {
                    setState(() {
                      _character = value;
                      _mainAxisAlignment = MainAxisAlignment.end;
                    });                    
                  },
                ),
                Text("End"),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "Event"
            ),
            Text(
              "Program"
            ),
          ],
        ),
      ),
    );
  }
}
