import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notesapp_firebase/Screens/Authentication/login.dart';
import 'package:notesapp_firebase/Screens/Authentication/signUp.dart';
import 'package:notesapp_firebase/Screens/Home/homeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('=======User is currently signed out!');
      } else {
        print('======User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //checks wether the user is signed in
      home: FirebaseAuth.instance.currentUser == null
          ? const Login()
          : const HomeScreen(),
      routes: {
        "Signup": (context) => const SignUp(),
        "Login": (context) => const Login(),
        "Home": (context) => const HomeScreen(),
      },
    );
  }
}
