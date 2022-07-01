

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:school_management/users/parents.dart';
import 'package:school_management/users/student.dart';

import 'package:school_management/users/teacher.dart';

import '../auth/model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _HomePageState();
  @override
  Widget build(BuildContext context) {
    const CircularProgressIndicator();
    return contro();
  }
}

class contro extends StatefulWidget {
  contro();

  @override
  _controState createState() => _controState();
}

class _controState extends State<contro> {
  _controState();
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  var rooll;
  var emaill;
  var id;
  var name;
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users") //.where('uid', isEqualTo: user!.uid)
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
    }).whenComplete(() {
      const CircularProgressIndicator();
      setState(() {
        emaill = loggedInUser.email.toString();
        rooll = loggedInUser.wrool.toString();
        id = loggedInUser.uid.toString();
        name = loggedInUser.username.toString();
        print(" ");
        print(id);
        print("");
      });
    });
  }

  routing() {
    if (rooll == "Student") {
      return Student(
        id: id,
      );
    } else if (rooll == "Teacher") {
      return Teacher(
        id: id,
      );
    } else if (rooll == "Parents") {
      return Parents(id: id);
    } else {
      return Container(color: Colors.white,
        child: Center(
          child: Container(
            height: 30,
            width: 30,
           child: CircularProgressIndicator(color: Colors.black,),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const CircularProgressIndicator();
    return routing();
  }
}
