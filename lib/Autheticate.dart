
import 'package:flutter/material.dart';
import 'package:tracker/Homescreen.dart';
import 'package:tracker/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Athenticate extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null) {
      return Homescreen();
    } else {
      return LoginScreen();
    }
  }
}
