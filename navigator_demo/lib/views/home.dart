import 'package:flutter/material.dart';
import 'package:navigator_demo/router.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Home')),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, feedRoute, arguments: 'Data from home');
        },
        child: Icon(
          Icons.add
        ),
      ),
    );
  }
}