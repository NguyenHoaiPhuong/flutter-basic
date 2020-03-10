// library homepage;

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;

  HomePage({this.title});

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  MainAxisAlignment _mainAxisAlignment;
  MainAxisAlignment _character;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text("Home Page", Colors.white, size: 25.0),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: _mainAxisAlignment,
              children: <Widget>[
                container("Item #1", 25.0, Colors.pink),
                container("Item #2", 25.0, Colors.lime),
                container("Item #3", 25.0, Colors.green),
              ],
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Radio(
                  value: MainAxisAlignment.spaceEvenly,
                  groupValue: _character,
                  onChanged: (value) {
                    setState(() {
                      _character = value;
                      _mainAxisAlignment = MainAxisAlignment.spaceEvenly;
                    });
                  },
                ),
                text("Evenly", Colors.blue),

                Radio(
                  value: MainAxisAlignment.start,
                  groupValue: _character,
                  onChanged: (value) {
                    setState(() {
                      _character = value;
                      _mainAxisAlignment = MainAxisAlignment.start;
                    });
                  },
                ),
                text("Start", Colors.blue),

                Radio(
                  value: MainAxisAlignment.end,
                  groupValue: _character,
                  onChanged: (value) {
                    setState(() {
                      _character = value;
                      _mainAxisAlignment = MainAxisAlignment.end;
                    });
                  },
                ),
                text("End", Colors.blue),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget text(String content, Color color, {double size = 12.0}) {
  return Text(
    content,
    style: TextStyle(
      color: color,
      fontSize: size
    ),
  );
}

Widget container(String content, double txtsize, Color bgColor, {Color txtColor = Colors.white}) {
  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: bgColor,
    ),
    child: text(content, txtColor, size: txtsize),
  );
}

Widget expended(String content, double txtsize, Color bgColor, {Color txtColor = Colors.white}) {
  return Expanded(
    child: Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bgColor,
      ),
      child: text(content, txtColor, size: txtsize),
    ),
  );
}