
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:oralens/files/Auth%20Page/LoginPAge/LoginPage.dart';
import 'package:oralens/files/Auth%20Page/LoginPAge/loginin.dart';
import 'package:oralens/files/Auth%20Page/SignUp/SignUpPage.dart';

import '../../Home/HomePage/HomePage.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(224, 224, 220, 222),
      body: Center(
        child: Column(
          children: [
          Container(
            //height: double.infinity*2,
           height: MediaQuery.of(context).size.height*0.45,
            alignment: AlignmentDirectional.center,
            //width: double.infinity*2,
              decoration: const BoxDecoration(
                color:Color.fromARGB(224, 224, 220, 222)
              ),
            child: Lottie.asset('assets/Doctor.json'),

            ),
            Container(
              //height: double.infinity*2,
              height: MediaQuery.of(context).size.height*0.55,
              alignment: AlignmentDirectional.bottomEnd,
              //width: double.infinity*2,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                  color: Colors.indigoAccent

              ),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Container( alignment: Alignment.topCenter, child: const Column(children: [  Text("Welcome", style: TextStyle(fontSize: 40,fontWeight: FontWeight.w500),),
                    Text("To",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400),),
                    Text("OraLens",style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold),)
                  ],),),
                  SizedBox(height: 30,),
                  ElevatedButton(onPressed: (){Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) =>
                  Home__page()));}, child: Text("Login", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, color: Colors.black),), style: ButtonStyle( shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide.none, // No border
                    ),
                  ), fixedSize: MaterialStateProperty.all<Size>(Size(300, 60)) ,backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),),

                 SizedBox(height: 20,),

                  ElevatedButton(onPressed: (){Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                           RegisterPage()));}, child: Text("Register", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, color: Colors.black),), style: ButtonStyle( shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide.none, // No border
                    ),
                  ), fixedSize: MaterialStateProperty.all<Size>(Size(300, 60)) ,backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),),


                ],
              ),
            )
          ],
        ),

      ),
    );
  }
}
