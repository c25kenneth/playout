import 'package:flutter/material.dart';
import 'package:playout/signin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.green[100],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SignIn()
    );
  }
}
