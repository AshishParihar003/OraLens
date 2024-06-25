// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
//
// import 'package:flutter/material.dart';
// import 'package:oralens/files/Home/HomePage/HomePage.dart';
//
//
// class LoginPage extends StatefulWidget {
//   const LoginPage ({super.key});
//
//   @override
//   State<LoginPage> createState() => _HomepageState();
// }
//
// class _HomepageState extends State<LoginPage> {
//   Future<FirebaseApp> _initializeFirebase() async {
//     FirebaseApp firebaseApp = await Firebase.initializeApp();
//     return firebaseApp;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(234, 245, 240, 240),
//       body: FutureBuilder(
//         future: _initializeFirebase(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             return const Login_();
//           }
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         },
//       ),
//     );
//   }
// }
//
// class Login_ extends StatefulWidget {
//   const Login_({super.key});
//
//   @override
//   State<Login_> createState() => _Login_State();
// }
//
// class _Login_State extends State<Login_> {
//   static Future<User?> loginUsingEmailPassword(
//       {required String email,
//         required String password,
//         required BuildContext context}) async {
//     FirebaseAuth auth = FirebaseAuth.instance;
//
//     User? user;
//     try {
//       UserCredential userCredential = await auth.signInWithEmailAndPassword(
//           email: email, password: password);
//       user = userCredential.user;
//     } on FirebaseAuthException catch (e) {
//       if (e.code == "user-not-found") {
//         print("No User found for that email");
//       }
//     }
//     return user;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController emailController = TextEditingController();
//     TextEditingController passwordController = TextEditingController();
//
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(
//               height: 30,
//             ),
//             const Text(
//               "Login..",
//               style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 35,
//                   fontWeight: FontWeight.normal),
//             ),
//             const Text(
//               "Enter your Details",
//               style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 45,
//                   fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(
//               height: 44,
//             ),
//             TextField(
//               controller: emailController,
//               keyboardType: TextInputType.emailAddress,
//               decoration: const InputDecoration(
//                   hintText: "User Email",
//                   prefixIcon: Icon(
//                     Icons.mail,
//                     color: Colors.black,
//                   )),
//             ),
//             const SizedBox(
//               height: 24,
//             ),
//             TextField(
//               controller: passwordController,
//               obscureText: true,
//               decoration: const InputDecoration(
//                   hintText: "User Password",
//                   prefixIcon: Icon(
//                     Icons.password,
//                     color: Colors.black,
//                   )),
//             ),
//             const SizedBox(
//               height: 24,
//             ),
//             const Text("Forget Password",
//                 style: TextStyle(
//                   decoration: TextDecoration.underline,
//                   color: Colors.blue,
//                   fontSize: 20,
//                   fontWeight: FontWeight.w400,
//                 )),
//             const SizedBox(
//               height: 88,
//             ),
//             SizedBox(
//               width: double.infinity,
//               child: RawMaterialButton(
//                 fillColor: const Color.fromARGB(198, 34, 99, 33),
//                 elevation: 0,
//                 padding: const EdgeInsets.symmetric(vertical: 20),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12)),
//                 onPressed: () async {
//                   User? user = await loginUsingEmailPassword(
//                       email: emailController.text,
//                       password: passwordController.text,
//                       context: context);
//                   print(user);
//                   if (user != null) {
//                     Navigator.of(context).pushReplacement(MaterialPageRoute(
//                         builder: (context) => const HomePage()));
//                   }
//                 },
//                 child: const Text(
//                   "Login",
//                   style: TextStyle(
//                       fontSize: 25,
//                       fontWeight: FontWeight.bold,
//                       color: Color.fromARGB(217, 254, 254, 254)),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 70, top: 20),
//               child: TextButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) =>
//                           const HomePage()),
//                     );
//                   },
//                   child: const Text(
//                     "Continue as Guest",
//                     style: TextStyle(fontSize: 20),
//                   )),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold();
//   }
// }
