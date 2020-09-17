import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthImplementation{
   
Future<String> signin(String email, String password);
Future<String> signup(String email, String password);
Future<String> getCurrentUser();
Future<Void> signOut();

}

class Auth implements AuthImplementation{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> signin(String email, String password) async{

    FirebaseUser user = (await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password)).user;
    return user.uid;
  }

  Future<String> signup(String email, String password) async{

    FirebaseUser user = (await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)).user;
    return user.uid;
  }

  Future<String> getCurrentUser() async{
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.uid;
  }

  Future<Void> signOut() async{
    _firebaseAuth.signOut();

    return null;
  }
}

