import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:oralens/files/Home/HomePage/Next/patient.dart';


class InstructionPage extends StatelessWidget {
  const InstructionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const SizedBox(height: 100),
            const Text(
              'Read It Carefully!!',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 30),
            const Text(
              'Kindly softly open and subsequently close your mouth, ensuring that the audio of your jaw movement is accurately captured.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            const Text(
              'After pressing the “Start Recording” button, it will automatically begin recording for a duration of 20 seconds, after which it will be saved.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 70),
           Container(

             child: InkWell(
                 onTap: (){
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => const Patient()),
                   );
                 },
                 child: LottieBuilder.asset("assets/start.json")),
           )


          ],
        ),
      ),
    );
  }
}
