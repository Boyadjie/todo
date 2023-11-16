import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Home/homepage_v.dart';
import './colors.dart';

import 'package:todo/Theme/darkThemeProvider.dart';
import 'package:todo/Login/login_v.dart';
import 'package:todo/Register/register_v.dart';
import 'package:todo/Todo/todo_v.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth auth = FirebaseAuth.instance;

  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late FirebaseFirestore db;
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    db = FirebaseFirestore.instance;
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
    await themeChangeProvider.darkThemePreference.getTheme();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget? child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              textSelectionTheme: TextSelectionThemeData( cursorColor: CustomColorsLight.textBlack )
            ),
            initialRoute: '/',
            // debugShowCheckedModeBanner: false,
            // theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            // home: SplashScreen(),
            routes: {
              // When navigating to the "/" route, build the FirstScreen widget.
              '/': (context) => const Homepage(),
              // When navigating to the "/second" route, build the SecondScreen widget.
              '/login': (context) =>    LoginView(),
              '/register': (context) => RegisterView(),
              '/todo': (context) =>     TodoView(),
            },
          );
        },
      ),
    );
  }
}