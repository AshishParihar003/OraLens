import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:oralens/files/Home/HomePage/Next/new-patient.dart';

class Patient extends StatelessWidget {
  const Patient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(title: Text("Record TMJ Audio"),) ,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.1,),
              Container(

                height: MediaQuery.of(context).size.height*0.29,width: MediaQuery.of(context).size.width*0.6,
                padding: const EdgeInsets.all(20),
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  color: Colors.deepPurple[300],
                  borderRadius: BorderRadius.circular(20),
                  // Different shades of orange
                  border: Border.all(
                    color: Colors.black, // Color of the border
                    width: 4.0, // Width of the border
                  ),
                ),
                child: InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewPatient()),
                    );

                  },
                  child: Container(

                    child: Column(
                      children: [

                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: LottieBuilder.asset("assets/new.json",fit: BoxFit.fill,height: 150,),
                        ),
                         const SizedBox(height: 7,),
                        const Text('Old-Patient', style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                ),
              ),
            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            InkWell(

                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewPatient()),
                  );


              },
              child: Container(
                height: MediaQuery.of(context).size.height*0.285,width: MediaQuery.of(context).size.width*0.6,
                padding: const EdgeInsets.all(20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.green[500],
                  borderRadius: BorderRadius.circular(20),
                  // Different shades of orange
                  border: Border.all(
                    color: Colors.black, // Color of the border
                    width: 4.0, // Width of the border
                  ),
                ),
                child: Column(
                  children: [

                    LottieBuilder.asset("assets/old-patient.json",fit: BoxFit.fill,),
                    const SizedBox(height: 7,),
                    const Text('New-Patient', style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
            ),
            ],
            ),
      ),
    );
  }
}
