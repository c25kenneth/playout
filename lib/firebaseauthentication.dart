import 'package:firebase_auth/firebase_auth.dart';

Future<bool> canSignIn(String userEmail, userPassword) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: userEmail, password: userPassword); 
    return true; 
  } catch (e) {
    return false; 
  }
}

Future<bool> canRegister(String userEmail, userPassword) async {
  try {
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: userEmail, password: userPassword);
    return true; 
  } catch(e) {
    return false; 
  }
    
}

Future signOut() async {
  try {
    await FirebaseAuth.instance.signOut(); 
    return true; 
  } catch (e) {
    return false; 
  }
}