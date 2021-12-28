import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<bool> addEvent(String eventName, String personName, String time, String address, String latitude, String longitude, String description) async {
  try {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    String uid = user.uid; 
    CollectionReference events = Firestore.instance.collection('events');
    await events.add({
      'event_name':eventName, 
      'person_name' : personName, 
      'time' : time, 
      'address' : address, 
      'latitude' : latitude, 
      'longitude' : longitude, 
      'description' : description, 
      'user_id' : uid, 
    });
  } catch (e) {
    print(e.toString()); 
  }
}

