import 'package:flutter/material.dart';
import 'package:playout/register.dart'; 

class SignIn extends StatefulWidget {
  const SignIn({ Key key }) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign into Playout!'),
        actions: [
          FlatButton(
            onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Register()));
            },
            child: Text('Register'), 
          ),
        ],
      ),
    );
  }
}