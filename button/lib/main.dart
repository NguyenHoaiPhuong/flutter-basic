import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Button Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Button'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _content = 'Please click one button below';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(
              child: normalText(_content),
            ),
            FlatButton(
              child: normalText('Flat button'),
              onPressed: () {
                setState(() {
                  _content = 'Flat button';
                });
              },
            ),
            RaisedButton(
              child: normalText('Raised button'),
              onPressed: () {
                setState(() {
                  _content = 'Raised button';
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.alarm_on,
                color: Colors.blue,
                size: 36,
              ),
              onPressed: () {
                setState(() {
                  _content = "Icon alarm on button";
                });
              },
            ),
            Material(
              color: Colors.orange,
              child: InkWell(
                onTap: () {
                  setState(() {
                    _content = 'Material InkWell on tap';
                  });
                },
                child: Container(
                  width: 80.0,
                  height: 80.0,
                ),
              ),
            ),
            RawMaterialButton(
              child: Icon(
                Icons.play_arrow,
                color: Colors.limeAccent,
              ),
              shape: CircleBorder(),
              // splashColor: Colors.transparent,
              fillColor: Colors.deepPurpleAccent,
              // highlightColor: Colors.transparent,
              onPressed: () {
                setState(() {
                  _content = "Raw material button";
                });
              },
            )
          ],
        ));
  }
}

Widget normalText(String content) {
  return Text(
    content,
  );
}
