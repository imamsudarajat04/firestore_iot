import 'package:firebase_core/firebase_core.dart';
import 'package:uts_1220438/ui/firestore_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      projectId: "utsp6-1c342",
      appId: "1:1013575822155:android:5eedf6cd766f62462856ce",
      apiKey: "AIzaSyDYjoN3wshC4CZvMCylZC9FgGMUDWJx_FQ",
      messagingSenderId: "",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firestore App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirestoreScreen(),
    );
  }
}
