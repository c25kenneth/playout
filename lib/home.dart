import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:playout/createevents.dart';
import 'package:playout/firebaseauthentication.dart';
import 'package:playout/firestoredatabase.dart';
import 'package:playout/myevents.dart';
import 'package:playout/signin.dart';

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
            child: Text('Sign Out'),
            onPressed: ()async{
              await signOut(); 
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn()));
          },),
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
                return Container(
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
    );
  }
}
