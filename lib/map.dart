import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart'; 
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EventMap extends StatelessWidget {
  const EventMap({ Key key, this.documents, this.initialPosition, this.mapController }) : super(key: key);
  
  final List<DocumentSnapshot> documents; 
  final LatLng initialPosition; 
  final Completer<GoogleMapController> mapController; 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(title: Text('Find your event!'), centerTitle: true,),
          body: GoogleMap(
        initialCameraPosition: CameraPosition(target: initialPosition, zoom: 12), 
        markers: documents.map((document) => Marker(
          markerId: MarkerId(document.documentID), 
          icon: BitmapDescriptor.defaultMarkerWithHue(350.0), 
          position: LatLng(
            double.parse(document.data['latitude']),
            double.parse(document.data['longitude']), 
          ),
          infoWindow: InfoWindow(
            title: document.data['event_name'],
            snippet: document.data['address']
          ),
        )).toSet(),
        onMapCreated: (mapController) {
          this.mapController.complete(mapController); 
        },
      ),
    );
  }
}