import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:playout/createevents.dart';
import 'package:playout/firebaseauthentication.dart';
import 'package:playout/map.dart';
import 'package:playout/myevents.dart';
import 'package:playout/signin.dart';

class Home extends StatefulWidget {
  const Home({ Key key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0; 
  final Completer<GoogleMapController> _mapController = Completer(); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current events!'),
        actions: [
          FlatButton.icon(
            onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyEvents()));
          },
          icon: Icon(Icons.person),
          label: Text('My Events'),
          ),
          FlatButton(
            onPressed: ()async{
              var result = await signOut();
              if (result == true) {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn()));
              } 
          },
          child: Text('Sign Out'),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('events').snapshots(), 
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator(); 
          } else {
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                final document = snapshot.data.documents[index]; 
                return EventCard(document);
              },
            );
          }
        },
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
      persistentFooterButtons: [
          StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('events').snapshots(),
            builder: (context, snapshot) {
              return Container(
                width: 900,
                child: FlatButton.icon(label: Text('View on Map!'), 
                  icon: Icon(Icons.location_on),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => EventMap(documents: snapshot.data.documents, mapController: _mapController, initialPosition: const LatLng(47.61657864660121, -122.20093137521792),)));
                  }  
                ),
              );
            }
          ),
        
        
        
      ],
    );
  }
}

class EventCard extends StatelessWidget {
  var document;
  EventCard(this.document); 

  @override
  Widget build(BuildContext context) {
    return  Container(
        child: Card(
          child:                      
                Column(
                children: [
                  Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    document['event_name'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35.0),
                  ),
                ), 
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    document['address'], 
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'At ' + document['time'], 
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0),
                  ),
                ),
                SizedBox(height: 15.0),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Description: ' + document['description'], 
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0),
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Created by ' + document['person_name'], 
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25.0),
                ),
                ],
                ),
                
            ),
        
        padding: EdgeInsets.all(10.0),
      );
  }
}