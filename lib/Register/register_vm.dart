import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/Home/homepage_v.dart';

class RegisterViewModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> registerUser(BuildContext context, String email, String password, String firstName, String lastName, String username) async {
    try {
      // Register user
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = <String, dynamic>{
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "username": username
      };

      _db.collection("users").add(user).then((DocumentReference doc) =>
          print('DocumentSnapshot added with ID: ${doc.id}'));

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Homepage()),
      );

      // Registration successful, you can handle this accordingly, e.g., show a success message.
      print('Registration successful: ${userCredential.user?.uid}');
    } catch (e) {
      // Handle registration errors, e.g., display an error message.
      print('Registration failed: $e');
    }
  }
}