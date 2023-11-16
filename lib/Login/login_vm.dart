import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/Todo/todo_v.dart';

class LoginViewModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> loginUser(BuildContext context, String email, String password) async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Login...')),
    );

    try {
      // Login user
      final userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      final user = await userCredential.user;
      final docSnapshot = await _db.collection("users").doc(user?.email).get();

      if (docSnapshot.exists) {
        final userDetails = docSnapshot.data() as Map<String, dynamic>;

        print('User detailed informations: $userDetails');

        // Retrieve the username from the document
        final username = userDetails['username'] as String;

        // Registration successful, show a success message.
        await ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login successful. Welcome $username!')),
        );

        // Navigate to the TodoView page
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => TodoView()),
        );
      } else {
        // Handle the case where the user document doesn't exist
        print('User document not found in Firestore for email: $email');
      }
    } catch (e) {
      // Handle registration errors, e.g., display an error message.
      print('Login failed: $e');
    }
  }
}