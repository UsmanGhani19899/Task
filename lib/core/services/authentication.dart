// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:project/core/models/user_model.dart';
// import 'package:project/dashboard.dart';
// import 'package:project/login.dart';

// class Authentication extends StatefulWidget {
//   const Authentication({Key? key}) : super(key: key);

//   @override
//   _AuthenticationState createState() => _AuthenticationState();
// }

// class _AuthenticationState extends State<Authentication> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     FirebaseAuth.instance.authStateChanges().listen((User? user) {
//       if (user == null) {
//         Login();
//       } else {
//         Dashboard();
//       }
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return user;
//   }
// }
