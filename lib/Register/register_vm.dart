import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/Home/homepage_v.dart';

class RegisterViewModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> registerUser(BuildContext context, String email, String password, String firstName, String lastName, String username) async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Registering...')),
    );

    try {
      // Register user
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = <String, dynamic>{
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "username": username
      };

      await _db.collection("users").add(user).then((DocumentReference doc) =>
          print('DocumentSnapshot added with ID: ${doc.id}'));

      // Registration successful, show a success message.
      await ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registered successfully. Welcome ${username} !')),
      );

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Homepage()),
      );
    } catch (e) {
      // Handle registration errors, e.g., display an error message.
      print('Registration failed: $e');
    }
  }
}