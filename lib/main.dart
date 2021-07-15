import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tracker/Autheticate.dart';
import 'package:tracker/Homescreen.dart';
import 'package:tracker/LoginScreen.dart';
import 'package:tracker/Profilepage.dart';
import 'package:geolocator/geolocator.dart';//geolocator
import 'package:geocoding/geocoding.dart';//geocoding
import 'package:google_maps_flutter/google_maps_flutter.dart'; //googlemaps 


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Athenticate(),
      /*routes: <String,WidgetBuilder>
      {
        "login":(BuildContext context)=>LoginScreen(),
        "profile":(BuildContext context)=>Profilepage(),

      }*/
  );
  }
}
