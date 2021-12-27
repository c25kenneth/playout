import 'package:flutter/material.dart';
import 'package:playout/register.dart'; 

class SignIn extends StatefulWidget {
  const SignIn({ Key key }) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  String _email = ''; 
  String _password ='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign into Playout! ✌'),
        actions: [
          FlatButton(
            onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Register()));
            },
            child: Text('Register'), 
          ),
        ],
      ),
      body: Column(
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
            onPressed: (){}, 
            child: Text('Sign In'), 
            color: Colors.purple,
          )
        ],
      ),
    );
  }
}