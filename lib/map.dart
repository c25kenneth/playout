import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart'; 
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EventMap extends StatefulWidget {
  
  var documents;
  EventMap({this.documents});

  @override
  _EventMapState createState() => _EventMapState();
}

class _EventMapState extends State<EventMap> {
  Completer<GoogleMapController> _controller = Completer();

  LatLng initialPosition = LatLng(47.61650630386803, -122.20093135958706);
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('View events on the map!')),
      body: Text('Map'),
      
    );
  }
}