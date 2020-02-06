import 'package:flutter/material.dart';

//final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Notification Clicked'));

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "AppBar Demo",
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add_alert),
              tooltip: 'Show SnackBar',
              onPressed: () {
//              scaffoldKey.currentState.showSnackBar(snackBar);
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: new Text("Alert Dialog title"),
                        content: new Text('Alert Dialog body'),
                        actions: <Widget>[
                          new FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: new Text("Close"),
                          ),
                        ],
                      );
                    }
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.close),
              tooltip: 'close',
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
        body: const Center(
          child: Text(
            "This is an AppBar Demo",
          ),
        ),
      ),
    );
  }

}