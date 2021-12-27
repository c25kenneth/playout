import 'package:flutter/material.dart';

class MyEvents extends StatefulWidget {
  const MyEvents({ Key key }) : super(key: key);

  @override
  _MyEventsState createState() => _MyEventsState();
}

class _MyEventsState extends State<MyEvents> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('My Events!'),
    );
  }
}