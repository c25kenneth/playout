import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Playout!'),
        centerTitle: true,

      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index; 
          });
        }, 
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Current Events', 
          ), 
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My Events', 
          ), 
          BottomNavigationBarItem(
            icon: Icon(Icons.build),
            label: 'Add Event', 
          ), 
        ],
      ),
    );
  }
}