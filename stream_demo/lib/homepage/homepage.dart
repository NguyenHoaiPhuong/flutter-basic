import 'package:flutter/material.dart';

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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          // Text(
          //   '$_counter',
          //   style: Theme.of(context).textTheme.headline4,
          // ),
        ],
      ),
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
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
        SizedBox(width: 10.0,),
        FloatingActionButton(
          onPressed: () {
            print('Decrement');
          },
          tooltip: 'Decrement',
          child: Icon(Icons.remove),
        ),
      ],
    );
  }
}