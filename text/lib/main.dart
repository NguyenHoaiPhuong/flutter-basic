import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Text Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  final title;

  HomePage({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text("Home Page", Colors.white, 25.0),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            text("This is a simple text", Colors.black, 15.0),
            overflowText("This is an overflow text", Colors.blue, 50.0),
            RichText(
              softWrap: true,
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'I am ',
                    style: TextStyle(color: Colors.black, fontSize: 15.0),
                  ),
                  TextSpan(
                    text: 'RichText ',
                    style: TextStyle(color: Colors.green, fontSize: 24.0),
                  ),
                  TextSpan(
                    text: 'similar to  ',
                    style: TextStyle(color: Colors.blue, fontStyle: FontStyle.italic, fontSize: 20.0),
                  ),
                  TextSpan(
                    text: 'Text.rich',
                    style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget text(String content, Color color, double size) {
  return Text(
    content,
    style: TextStyle(
      color: color,
      fontSize: size
    ),
  );
}

Widget overflowText(String content, Color color, double size) {
  return Text(
    content,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      color: color,
      fontSize: size
    ),
  );
}
