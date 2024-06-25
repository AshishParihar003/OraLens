import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oralens/files/Auth%20Page/WelcomePAge/Welcome.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //home: WelcomePage(),
      home: WelcomePage(),
      debugShowCheckedModeBanner: false
      ,
    );
  }
}