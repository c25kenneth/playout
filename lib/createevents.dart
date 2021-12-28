import 'package:flutter/material.dart';

class CreateEvents extends StatefulWidget {
  const CreateEvents({ Key key }) : super(key: key);

  @override
  _CreateEventsState createState() => _CreateEventsState();
}

class _CreateEventsState extends State<CreateEvents> {

  final formKey = GlobalKey<FormState>();
  String eventName;
  String personName; 
  String time; 
  String address; 
  String latitude; 
  String longitude;
  String description; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Create your own event!'),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Center(
          child:
                Column(
              children: [
                Text('Configure your event! 🔨', style: TextStyle(
                  fontWeight: FontWeight.bold, 
                  fontSize: 20, 
                ),           
              ), 
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Event Name',
                    ),
                    validator: (val) => val.isEmpty ? 'Enter in the event name!' : null,
                    onChanged: (val){
                      setState(() {
                        eventName = val; 
                      });
                    },
                  ),
                  padding: EdgeInsets.all(5.0),
                ),
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Your Name (Will be public)',
                    ),
                    validator: (val) => val.isEmpty ? 'Enter in your name!' : null,
                    onChanged: (val){
                      setState(() {
                        personName = val; 
                      });
                    },
                  ),
                  padding: EdgeInsets.all(5.0),
                ),
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Event Time',
                    ),
                    validator: (val) => val.isEmpty ? 'Enter in the meeting time!' : null,
                    onChanged: (val){
                      setState(() {
                        time = val; 
                      });
                    },
                  ),
                  padding: EdgeInsets.all(5.0),
                ),
                Container(
                  child: TextFormField(
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                      hintText: 'Address of meeting place',
                    ),
                    validator: (val) => val.isEmpty ? 'Enter in the address of the location!' : null,
                    onChanged: (val){
                      setState(() {
                        address = val; 
                      });
                    },
                  ),
                  padding: EdgeInsets.all(5.0),
                ),
                Container(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Latitude of meeting location',
                    ),
                    validator: (val) => val.isEmpty ? 'Enter in the latitude of meeting place!' : null,
                    onChanged: (val){
                      setState(() {
                        latitude = val; 
                      });
                    },
                  ),
                  padding: EdgeInsets.all(5.0),
                ),
                Container(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Longitude of meeting location',
                    ),
                    validator: (val) => val.isEmpty ? 'Enter in the longitude of meeting place!' : null,
                    onChanged: (val){
                      setState(() {
                        longitude = val; 
                      });
                    },
                  ),
                  padding: EdgeInsets.all(5.0),
                  
                ),
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Quick Event Description',
                    ),
                    keyboardType: TextInputType.multiline, 
                    maxLines: 2, 
                    validator: (val) => val.isEmpty ? 'Enter in an event description!' : null,
                    onChanged: (val){
                      setState(() {
                        description = val; 
                      });
                    },
                  ),
                  padding: EdgeInsets.all(5.0),
                ),
                FlatButton(
                  child: Text('Add your event! 🎇'), 
                  onPressed: (){
                    if (formKey.currentState.validate()) {
                      print('Everything looks good!');
                    } else {
                      print('Make sure all fields are completed!');
                    }
                  },
                  color: Colors.purpleAccent,
                ),
              ],
            ),
          ),
        ),
    );
  }
}