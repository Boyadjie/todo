import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/Todo/todo_v.dart';

class TodoViewModel {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> getAuthUsername() async {
    final myAuth = _auth.currentUser;

    final docSnapshot = await _db.collection("users").doc(myAuth?.email).get();
    final userDetails = docSnapshot?.data() as Map<String, dynamic>;

    // Retrieve the username from the document
    final username = userDetails['username'] as String;

    return username ?? ''; // Return the email or an empty string if it's null
  }

  Future<List<TaskInfo>> getTaskList() async {
    List<TaskInfo> taskList = [];

    try {
      final querySnapshot = await _db.collection("tasks").get();
      for (final doc in querySnapshot.docs) {
        final taskDetails = doc.data() as Map<String, dynamic>;
        final taskInfo = TaskInfo.fromMap(taskDetails);
        taskList.add(taskInfo);
      }
    } catch (e) {
      print('Error getting task list: $e');
    }

    return taskList;
  }

  Future<int> getTaskCount() async {
    try {
      final querySnapshot = await _db.collection("tasks").get();
      return querySnapshot.size;
    } catch (e) {
      print('Error getting task count: $e');
      return 0;
    }
  }

  Future<TaskInfo?> getTask(BuildContext context, String title) async {
    try {
      final docSnapshot = await _db.collection("tasks").doc(title).get();

      if (docSnapshot.exists) {
        final taskDetails = docSnapshot.data() as Map<String, dynamic>;
        return TaskInfo.fromMap(taskDetails);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Task not found!')),
        );
        return null;
      }
    } catch (e) {
      print('Error getting task details: $e');
      return null;
    }
  }

  Future<void> createTask(BuildContext context, String title) async {
    try {
      final docSnapshot = await _db.collection("tasks").doc(title).get();

      if(docSnapshot.exists) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('This tasks already exist !')),
        );
      }else {
        // create taks object
        final task = {
          "title": title,
          "completed": false
        };

        // send to db
        await _db.collection("tasks").doc(title).set(task).onError((e, _) => print("Error writing document: $e"));
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => TodoView()),
        );
      }

    } catch (e) {
      // Handle registration errors, e.g., display an error message.
      print('Can\'t create task: $e');
    }
  }

  Future<void> updateTask(BuildContext context, String title) async {
    try {
      final docSnapshot = await _db.collection("tasks").doc(title).get();
      final taskDetails = docSnapshot.data() as Map<String, dynamic>;

      // Retrieve the username from the document
      final isCompleted = taskDetails['completed'] as bool;

      // create new taks object
      final task = {
        "title": title,
        "completed": !isCompleted
      };

      // update in db
      await _db.collection("tasks").doc(title).update(task).onError((e, _) => print("Error updating document: $e"));

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => TodoView()),
      );
    } catch (e) {
      // Handle registration errors, e.g., display an error message.
      print('Can\'t create task: $e');
    }
  }
}

class TaskInfo {
  final String title;
  final bool completed;

  TaskInfo({required this.title, required this.completed});

  factory TaskInfo.fromMap(Map<String, dynamic> map) {
    return TaskInfo(
      title: map['title'] as String,
      completed: map['completed'] as bool,
    );
  }

  @override
  String toString() {
    return 'TaskInfo{title: $title, completed: $completed}';
  }
}