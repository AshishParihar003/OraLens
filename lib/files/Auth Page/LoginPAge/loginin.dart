import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:oralens/files/Auth%20Page/SignUp/SignUpPage.dart';
import 'package:oralens/files/Home/HomePage/HomePage.dart';

import 'package:oralens/files/Home/HomePage/introduction.dart';


class Home__page extends StatefulWidget {
  const Home__page({super.key});

  @override
  State<Home__page> createState() => _HomepageState();
}

class _HomepageState extends State<Home__page> {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(234, 245, 240, 240),
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const Login_();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class Login_ extends StatefulWidget {
  const Login_({super.key});

  @override
  State<Login_> createState() => _Login_State();
}

class _Login_State extends State<Login_> {
  bool _isLoading = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  static Future<User?> loginUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        _showErrorDialog(context, "No user found for that email.");
      } else if (e.code == "wrong-password") {
        _showErrorDialog(context, "Wrong password provided.");
      } else {
        _showErrorDialog(context, e.message ?? "An error occurred.");
      }
    }
    return user;
  }

  static void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Container(
              alignment: Alignment.topCenter,
              child: const Text(
                "Sign In",
                style: TextStyle(
                    color: Colors.indigoAccent,
                    fontSize: 60,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  hintText: "User Email",
                  prefixIcon: Icon(
                    Icons.mail,
                    color: Colors.black,
                  )),
            ),
            const SizedBox(
              height: 24,
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                  hintText: "User Password",
                  prefixIcon: Icon(
                    Icons.password,
                    color: Colors.black,
                  )),
            ),
            const SizedBox(
              height: 24,
            ),
            const SizedBox(
              height: 88,
            ),
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : Container(
              width: double.infinity,
              child: RawMaterialButton(
                fillColor: Colors.blueAccent,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                onPressed: () async {
                  setState(() {
                    _isLoading = true;
                  });
                  User? user = await loginUsingEmailPassword(
                    email: _emailController.text,
                    password: _passwordController.text,
                    context: context,
                  );
                  setState(() {
                    _isLoading = false;
                  });
                  if (user != null) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => IntroductionPage(),
                      ),
                    );
                  }
                },
                child: const Text(
                  "Sign In",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(217, 254, 254, 254)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 130, top: 20),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: const Text(
                  "Register",
                  style: TextStyle(
                      fontSize: 25, decoration: TextDecoration.underline),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 130, top: 20),
            //   child: TextButton(
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => HomePage()),
            //       );
            //     },
            //     child: const Text(
            //       "Guest",
            //       style: TextStyle(
            //           fontSize: 25, decoration: TextDecoration.underline),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
