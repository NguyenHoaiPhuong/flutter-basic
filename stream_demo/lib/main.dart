import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Stream Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Stream Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: StreamBuilder(
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return text("1 Minute Completed");
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return text('Waiting For Stream');
            }
            return Text(
              '00:${snapshot.data.toString().padLeft(2, '0')}',
              style: TextStyle(fontSize: 30.0, color: Colors.blue),
            );
          },
          initialData: 0,
          stream: _stream(),
        ),
      ),
    );
  }

  Stream<int> _stream() {
    Duration interval = Duration(seconds: 1);
    Stream<int> stream = Stream<int>.periodic(interval, callback);
    stream = stream.take(59);
    return stream;
  }

  int callback (int i) => i;
}

Text text(String content) {
  return Text(
    content,
    style: TextStyle(fontSize: 30.0),
  );
}