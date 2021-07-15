import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tracker/Createaccount.dart';
import 'package:flutter/material.dart';
import 'package:tracker/Homescreen.dart';
import 'package:tracker/Methods.dart';
import 'package:tracker/Profilepage.dart';

class Maindrawer extends StatefulWidget {
  @override
  _MaindrawerState createState() => _MaindrawerState();
}

class _MaindrawerState extends State<Maindrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.blue[900],
            padding: EdgeInsets.all(20),
          ),

          /*GestureDetector(
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => Profilepage())),
            child: Text(
              "profilepage",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),*/
          ListTile(
            leading: Icon(Icons.account_box_rounded),
            title: Text(
              'Profilepage',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (_) =>
                    Memberinfo())), //rishabs profile page is called here
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              'logout',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () => logout(context),
          ),
          ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                'Setting',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onTap: () {}),
          ListTile(
              leading: Icon(Icons.bolt_rounded),
              title: Text(
                'About',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onTap: () {}),
        ],
      ),
    );
  }
}
