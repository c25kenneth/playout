import 'package:flutter/material.dart';
import 'package:playout/signin.dart';

class Register extends StatefulWidget {
  const Register({ Key key }) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register for Playout!'), 
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
    );
  }
}