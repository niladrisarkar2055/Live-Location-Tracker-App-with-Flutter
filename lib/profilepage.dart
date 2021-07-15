import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tracker/main.dart';

/*
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class Profilepage extends StatefulWidget {
  const Profilepage({Key? key}) : super(key: key);

  @override
  _ProfilepageState createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  Map<dynamic, dynamic>? usermap;

  fetchdata() async {
    /*CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('users');
    collectionReference.snapshots().listen((snapshot) {
      setState(() {
        usermap = snapshot.docs[0].data() as Map?;
      });*/
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    await _firestore.collection('users').get().then((value) {
      setState(() {
        usermap = value.docs[0].data();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "profilepage",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.blue[900],
      ),
      body: Column(
        children: [
          Text(
            'Profile info',
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: fetchdata,
            child: Text('profile'),
          ),
          usermap != null
              ? Center(
                  child: ListTile(
                    onTap: () {},
                    title:
                        Center(child: Text('user name: ' + usermap!['name'])),
                    subtitle:
                        Center(child: Text('email: ' + usermap!['email'])),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}*/

User? loggedinuser;

class Memberinfo extends StatefulWidget {
  @override
  _MemberinfoState createState() => _MemberinfoState();
}

class _MemberinfoState extends State<Memberinfo> {
  final _auth = FirebaseAuth.instance;
  final userCollection = FirebaseFirestore.instance.collection("users");

  final userlocation = FirebaseFirestore.instance.collection("location");
  late String name, email, uid, location;
  void getcurrentuser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedinuser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  void initState() {
    super.initState();
    getcurrentuser();
  }

  Future<void> userdata() async {
    final uid = loggedinuser!.uid;
    DocumentSnapshot ds = await userCollection.doc(uid).get();
    DocumentSnapshot loc = await userlocation.doc(uid).get();
    name = ds.get('name');
    email = ds.get('email');
    location = loc.get('location');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Porfile Page',
          ),
        ),
        body: Center(
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 200),
                FutureBuilder(
                  future: userdata(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done)
                      return Text('loading');
                    return Column(
                      children: [
                        Text(
                          "$name",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                          ),
                        ),
                        Text(
                          "$email",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                          ),
                        ),
                        Text(
                          "$location",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        )
                      ],
                    );
                  },
                ),
                Padding(padding: EdgeInsets.fromLTRB(100, 0, 0, 0))
              ],
            ),
          ),
        ));
  }
}
