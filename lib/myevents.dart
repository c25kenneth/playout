import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:playout/home.dart';

class MyEvents extends StatefulWidget {
  const MyEvents({ Key key }) : super(key: key);

  @override
  _MyEventsState createState() => _MyEventsState();
}

class _MyEventsState extends State<MyEvents> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<String> getUID() async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    final uid = user.uid;
    return uid; 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My events'),
        actions: [
          FlatButton.icon(
            label: Text('All Events'),
            icon: Icon(Icons.event_available_outlined),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
            } 
          )
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator(); 
          } else {
            return StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection('events').where('user_id', isEqualTo: snapshot.data.uid).snapshots(),
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    final document = snapshot.data.documents[index]; 
                    return Container(
                      child: Card(
                        child: Column(
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
                  },
                );
              }
            );
          }
        },
      ),
    );
  }
}