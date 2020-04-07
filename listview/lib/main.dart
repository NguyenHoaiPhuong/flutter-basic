import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Listview Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Listview Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  final List<int> colors = [
    50,
    100,
    200,
    300,
    400,
    500,
    600,
    700,
    800,
    900
  ];

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 35.0, maxHeight: 600.0),
        child: Row(
          children: [
            Expanded(child: _listBuilder())
          ],
        ),
      ),
    );
  }

  Widget _listBuilder() {
    return ListView.builder(
      itemCount: 500,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          height: 50.0,
          child: Text(
            'Item #$index',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20.0,
            ),
          ),
          color: Colors.amber[colors[index%10]],
          alignment: Alignment.center,
        );
      },
    );
  }

}