import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tracker/Gmap.dart';
import 'package:tracker/Methods.dart';
import 'package:tracker/Maindrawer.dart';
import 'package:tracker/Profilepage.dart';
import 'package:tracker/Search.dart';
import 'package:tracker/Search2.dart';
import 'package:tracker/location.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  TextEditingController nameController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Homepage",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.blue[900],
      ),
      endDrawer: Maindrawer(),
      body: Column(
        children: [
          SizedBox(height: 10),
          /*Center(
            child: Container(
              height: 400,
              child: Image(
                image: AssetImage("images/login.jpg"),
                fit: BoxFit.contain,
              ),
            ),
          ),*/

          SizedBox(height: 10),
          Center(
            child: Container(
              height: 100,
              child: Text(
                "Welcome to Home page",
                style: TextStyle(
                  color: Colors.orange[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          /*Container(
            child: ElevatedButton(
              onPressed: () => logout(context),
              child: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),*/

          //user location normal gesture detector button
          GestureDetector(
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => Location())),
            child: Text(
              "Location",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 30),
          /*TextFormField(
            style: TextStyle(color: Colors.white),
            decoration: inputDecoration("Country Name"),
            controller: nameController,
          ),*/

          GestureDetector(
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => Gmap())),
            child: Text(
              "Googlemaps",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 30),

          
          GestureDetector(
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => Search())),
            child: Text(
              "Search for other user",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Container(
              height: 300,
              child: Image(
                image: AssetImage("images/login.jpg"),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* input decoration fun
InputDecoration inputDecoration(String labelText) {
  return InputDecoration(
    focusColor: Colors.red,
    labelStyle: TextStyle(color: Colors.green),
    labelText: labelText,
    fillColor: Colors.yellow,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(color: Colors.black),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(
        color: Colors.black,
        width: 2.0,
      ),
    ),
  );
}*/
