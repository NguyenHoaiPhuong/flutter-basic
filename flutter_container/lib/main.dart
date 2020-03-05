import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Container Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}


class MyHomePage extends StatelessWidget {
  MyHomePage({this.title});

  @override
  Widget build(BuildContext context) {
    double fSize = 25.0;
    return Scaffold(
      appBar: AppBar(
        title: Text("Container"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(5.0),
                color: Theme
                  .of(context)
                  .primaryColor,
                child: Center(
                  child: Text(
                    'I am also Slanting, but see my edges',
                    style: TextStyle(fontSize: fSize, color: Colors.white),
                  ),
                  ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                color: Theme
                  .of(context)
                  .primaryColor,
                alignment: Alignment.center,
                child: Text(
                  'Hai, I am slanting',
                  style: TextStyle(fontSize: fSize*2, color: Colors.white),
                ),
                transform: Matrix4.skewY(0.1),
              ),
              SizedBox(
                height: 50,
                // child: Text(
                //   'Size box',
                //   style: TextStyle(fontSize: fSize*3, color: Colors.black),
                // ),
              ),
              Container(
                constraints: BoxConstraints.expand(
                  height: Theme.of(context).textTheme.headline1.fontSize,
                ),
                color: Theme
                  .of(context)
                  .primaryColor,
                alignment: Alignment.center,
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'I am also slanting, but see my edges',
                  style: TextStyle(fontSize: fSize/1.5, color: Colors.white),
                ),
                transform: Matrix4.skewY(0.1),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 200,
                width: 200,
                color: Colors.blue,
                child: Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.yellow,
                  ),
                ),
              ),
            ],
          ),
          ),
      ),
    );
  }
  
  final String title;
}

