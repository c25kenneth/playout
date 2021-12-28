import 'package:flutter/material.dart';
import 'package:playout/allevents.dart';
import 'package:playout/createevents.dart';
import 'package:playout/myevents.dart';

class Home extends StatefulWidget {
  const Home({ Key key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0; 
  
  List screens = [
    AllEvents(), 
    MyEvents(),
    CreateEvents(), 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Playout!'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        splashColor: Colors.greenAccent[200],
        backgroundColor: Colors.green[300],
        tooltip: 'Add a new event!',
        child: Text(
          '🛠', 
          style: TextStyle(fontSize: 32),
        ),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreateEvents()));
        },
      ),
    );
  }
}