import 'package:flutter/material.dart';

class AllEvents extends StatefulWidget {
  const AllEvents({ Key key }) : super(key: key);

  @override
  _AllEventsState createState() => _AllEventsState();
}

class _AllEventsState extends State<AllEvents> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('All Events!'),
    );
  }
}