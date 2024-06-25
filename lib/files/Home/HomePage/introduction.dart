import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'HomePage.dart'; // Ensure you have your HomePage imported

class IntroductionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Introduction'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/Hello.json', // Ensure the Lottie file is added in the assets folder
              width: 300,
              height: 300,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 30),
            Text(
              'Welcome to Our App!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'This app will help you manage your tasks efficiently. Let\'s get started!',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),Text(
              'This app will help you manage your tasks efficiently. Let\'s get started!',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),Text(
              'This app will help you manage your tasks efficiently. Let\'s get started!',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),

              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              icon: const Icon(Icons.home),
              label: const Text("Go to Home Page",style: TextStyle(fontSize: 20),),
            ),
          ],
        ),
      ),
    );
  }
}
