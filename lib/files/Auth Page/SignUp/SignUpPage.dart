

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../Home/HomePage/HomePage.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _aadharController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _register() async {
    if (_passwordController.text != _confirmPasswordController.text) {
      // Display error message
      return;
    }

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'name': _nameController.text,
        'aadhar': _aadharController.text,
        'contact': _contactController.text,
        'place': _placeController.text,
        'email': _emailController.text,
      });

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()), // Adjust according to your navigation setup
      );
    } catch (e) {
      print('Error: $e');
      // Display error message
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( centerTitle: true ,title: Text('Register',style: TextStyle(

          color: Colors.indigoAccent,
          fontSize: 40,
          fontWeight: FontWeight.bold),)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(

            children: [

              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),

              ),
              TextField(
                controller: _aadharController,
                decoration: InputDecoration(labelText: 'Aadhar Number'),
              ),
              TextField(
                controller: _contactController,
                decoration: InputDecoration(labelText: 'Contact Number'),
              ),
              TextField(
                controller: _placeController,
                decoration: InputDecoration(labelText: 'Place'),
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              TextField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(labelText: 'Confirm Password'),
                obscureText: true,
              ),
              SizedBox(height: 40),

              ElevatedButton(onPressed: (){Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          RegisterPage()));}, child: Text("Register", style: TextStyle(fontSize: 20, color: Colors.black),), style: ButtonStyle( shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide.none, // No border
                ),
              ), fixedSize: MaterialStateProperty.all<Size>(Size(300, 50)) ,backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent)),),

            ],
          ),
        ),
      ),
    );
  }
}
