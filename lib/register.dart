import 'package:flutter/material.dart';
import 'package:playout/firebaseauthentication.dart';
import 'package:playout/home.dart';
import 'package:playout/signin.dart';

class Register extends StatefulWidget {
  const Register({ Key key }) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  String _email = ''; 
  String _password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register for Playout! ✌'), 
        actions: [
          FlatButton(onPressed: (){
            Navigator.pushReplacement(
              context, 
              MaterialPageRoute(builder: (context) => SignIn()
            ));
          }, 
          child: Text('Sign In'))
        ],
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Email', 
                labelStyle: TextStyle(
                  color: Colors.grey[600],
                ),
                hintText: 'awesomeplayoutuser@gmail.com', 
                hintStyle: TextStyle(
                  color: Colors.grey, 
                ), 
              ), 
            ),
            padding: EdgeInsets.all(15),
          ),
          SizedBox(height: 15),
          Container(
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  _password = value;
                });
              },
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password', 
                hintText: 'awesomeplayoutuser@gmail.com', 
                hintStyle: TextStyle(
                  color: Colors.grey, 
                ), 
              ), 
            ),
            padding: EdgeInsets.all(15),
            
          ),

          FlatButton(
            onPressed: () async {
              dynamic result = await canRegister(_email, _password);
              if (result == true) {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
              } else {
                print('Cannot register! Try again later.');
              }
            }, 
            child: Text('Register'), 
            color: Colors.purple,
          )
        ],
      ),
    );
  }
}