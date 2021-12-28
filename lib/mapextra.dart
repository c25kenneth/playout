import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart'; 
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EventMapTest extends StatefulWidget {

  @override
  _EventMapTestState createState() => _EventMapTestState();
}

class _EventMapTestState extends State<EventMapTest> {
  Completer<GoogleMapController> _controller = Completer();

  LatLng initialPosition = LatLng(47.61650630386803, -122.20093135958706);
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('View events on the map!')),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('events').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator(); 
          }
          return GoogleMap(
            initialCameraPosition: CameraPosition(target: initialPosition, zoom: 12),
            markers: snapshot.data.documents.map((document) => Marker(
              markerId: MarkerId(document.documentID), 
              icon: BitmapDescriptor.defaultMarkerWithHue(350.0), 
              position: LatLng(
                document.data['latitude'],
                document.data['longitude'], 
              ),
              infoWindow: InfoWindow(
                title: document.data['event_name'],
                snippet: document.data['address']
              )
            )),
          );
        }
      ),

      
    );
  }
}