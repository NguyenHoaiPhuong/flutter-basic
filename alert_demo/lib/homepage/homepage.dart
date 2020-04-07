import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  final String title;

  Homepage({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomepageTop(title),
      body: HomepageBody(),
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
            color: Colors.blue[200],
            child: Text("Simple dialog"),
            onPressed: () {
              _simpleDialog(context);
            }
          ),

          RaisedButton(
            color: Colors.blue[200],
            child: Text("Alert dialog"),
            onPressed: () {
              _alertDialog(context);
            }
          ),

          RaisedButton(
            color: Colors.blue[200],
            child: Text("Time dialog"),
            onPressed: () {
              _timePickerDialog(context);
            }
          ),

          RaisedButton(
            color: Colors.blue[200],
            child: Text("Date dialog"),
            onPressed: () {
              _datePickerDialog(context);
            })
        ],
      ),
    );
  }

  Future<void> _simpleDialog(BuildContext context) async {
    switch ( await showDialog(
      context: context,
      child: SimpleDialog(
        title: Text('Simple dialog, is it nice?'),
        children: [
          SimpleDialogOption(
            child: Text('Yes'),
            onPressed: () => Navigator.pop(context, 'Yes'),
          ),
          SimpleDialogOption(
            child: Text('No'),
            onPressed: () => Navigator.pop(context, 'No'),
          )
        ],
      ),
    )) {
      case 'Yes':
        _showSnackbar(context, "Thanks!", 'Yes');
        break;
      case 'No':
        _showSnackbar(context, "Oh! No...Try to provide you best!", 'No');
        break;
    }
  } 

  Future<void> _alertDialog(BuildContext context) async {
    switch (await showDialog(
      context: context,
      child: AlertDialog(
        title: Text('Alert dialog, is it nice?'),
        actions: <Widget>[
          RawMaterialButton(
            child: Text('Yes'),
            onPressed: () {
              Navigator.pop(context, 'Yes');
            }
          ),
          RawMaterialButton(
            child: Text('No'),
            onPressed: () {
              Navigator.pop(context, 'No');
            }
          ),
        ],
      ),
    )) {
      case 'Yes':
        _showSnackbar(context, "Thanks!", 'Yes');
        break;
      case 'No':
        _showSnackbar(context, "Oh! No...Try to provide you best!", 'No');
        break;
    }
  }

  void _timePickerDialog(BuildContext context) {
    DateTime now = DateTime.now();

    showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: now.hour, minute: now.minute)
    ).then((value) => _showSnackbar(context, value.format(context), 'Yes')
    ).catchError(() => _showSnackbar(context, 'Error', 'Yes'));
  }

  void _datePickerDialog(BuildContext context) {
    DateTime now = DateTime.now();

    showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050)
    ).then((value) => _showSnackbar(context, value.toIso8601String(), 'Yes')
    ).catchError(() => _showSnackbar(context, 'Error', 'Yes'));
  }

  void _showSnackbar(BuildContext context, String text, String ans) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        duration: Duration(seconds: 2),
        backgroundColor: ans.compareTo('Yes') == 0? Colors.green : Colors.red,
      )
    );
  }
}