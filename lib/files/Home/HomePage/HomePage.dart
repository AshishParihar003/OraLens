
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:oralens/files/Home/HomePage/button.dart';
import 'package:oralens/files/Home/HomePage/drawer.dart';
import 'Next/nextinstruction.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: const Text("Welcome",style: TextStyle(fontWeight: FontWeight.w500),),centerTitle: true,backgroundColor: Colors.blue[100],),
      drawer: const drawerPage(),

        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                Colors.blue,// Start color
                Colors.green, // End color
              ],
            ),
          ),
          child: Column(
            children: [
              Container(
                  alignment: AlignmentDirectional.center,
                  child: const Column(
                    children: [
                      SizedBox(height: 60),
                      Text("ORALENS ",style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
                      Text("TMJ AUDIO ",style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
                      Text("ANALYZER ",style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
                    ],
                  )),
              const SizedBox(height: 60),
              HoverButton(buttonText: "Record TMJ Audio", onPressed: (){ Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InstructionPage()),
              );// Close the drawer
             }, colors: Colors.red )
              ,const SizedBox(height: 60),

              Expanded(

                child: GridView.count(
                  padding: const EdgeInsets.all(10),
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 10, // Horizontal space between items
                  mainAxisSpacing: 10, // Vertical space between items
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.orange[400],
                        borderRadius: BorderRadius.circular(20),
                        // Different shades of orange
                        border: Border.all(
                          color: Colors.black, // Color of the border
                          width: 5.0, // Width of the border
                        ),
                      ),
                      child: Column(
                        children: [

                          LottieBuilder.asset("assets/help.json",fit: BoxFit.fill,height: 85,width: 85,),
                          const SizedBox(height: 7,),
                          const Text('Help', style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                        ],
                      ),
                    )
          ,Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.red[400],
                        borderRadius: BorderRadius.circular(20),// Different shades of orange
                        border: Border.all(
                          color: Colors.black, // Color of the border
                          width: 5.0, // Width of the border
                        ),
                      ),
                      child: Column(
                        children:  [

                        LottieBuilder.asset("assets/history.json",fit: BoxFit.fill,height: 85,width: 85,),
                const SizedBox(height: 7,),
                const Text('History', style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                ],
                      ),
                    )

                  ]
                ),
              ),

            ],
          ),
        )
    );
  }
}


