import 'package:flutter/material.dart';
import 'dart:async';

import 'package:stream_demo/homepage/counter_stream.dart';

class Homepage extends StatelessWidget {
  final String title;

  // Default constructor
  Homepage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomepageTop(title),
      body: HomepageBody(),
      floatingActionButton: HomepageBottom(),
    );
  }
}

class HomepageTop extends AppBar {
  HomepageTop(String title) : super(title: Text(title));
}

class HomepageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // StreamBuilder will automatically update the UI whenever date comes out of the stream
    return StreamBuilder(
      stream: CounterStream().counterController.stream,
      initialData: 0,
      builder: (context, snapshot) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${CounterStream().counter}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        );
      },
    );
  }
}

class HomepageBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          onPressed: () {
            print('Increment');
            CounterStream().counterEventController.add(CounterEvent.Increment);
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
        SizedBox(width: 10.0,),
        FloatingActionButton(
          onPressed: () {
            print('Decrement');
            CounterStream().counterEventController.add(CounterEvent.Decrement);
          },
          tooltip: 'Decrement',
          child: Icon(Icons.remove),
        ),
      ],
    );
  }
}