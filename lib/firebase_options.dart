// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD1nEIFXiQJ9WdHouMUjXXztYTQPS8_F-Y',
    appId: '1:646720097938:web:12ce45e0c8b630f8b2a04b',
    messagingSenderId: '646720097938',
    projectId: 'todo-2a4b4',
    authDomain: 'todo-2a4b4.firebaseapp.com',
    storageBucket: 'todo-2a4b4.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAHJsn96rpHrRpUcQ9fF1_JhfiJu5UR34I',
    appId: '1:646720097938:android:2c0edd06400f2dceb2a04b',
    messagingSenderId: '646720097938',
    projectId: 'todo-2a4b4',
    storageBucket: 'todo-2a4b4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC5figAbM6TdSsxVPGzwauplzAgKP-PYvg',
    appId: '1:646720097938:ios:45e4ce89006f4c9eb2a04b',
    messagingSenderId: '646720097938',
    projectId: 'todo-2a4b4',
    storageBucket: 'todo-2a4b4.appspot.com',
    iosBundleId: 'com.example.todo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC5figAbM6TdSsxVPGzwauplzAgKP-PYvg',
    appId: '1:646720097938:ios:7e2c0da819630cc9b2a04b',
    messagingSenderId: '646720097938',
    projectId: 'todo-2a4b4',
    storageBucket: 'todo-2a4b4.appspot.com',
    iosBundleId: 'com.example.todo.RunnerTests',
  );
}
