// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:movie_app_1/screens/otp.dart';
// import 'package:pinput/pinput.dart';

// class PhoneHome extends StatefulWidget {
//   const PhoneHome({super.key});

//   @override
//   State<PhoneHome> createState() => _PhoneHomeState();
// }

// class _PhoneHomeState extends State<PhoneHome> {
//   TextEditingController phonenumber = TextEditingController();

//   void sendcode()async {
//     try {
//       await FirebaseAuth.instance.verifyPhoneNumber(
//           phoneNumber: '+91' + phonenumber.text,
//           verificationCompleted: (PhoneAuthCredential credential) {},
//           verificationFailed: (FirebaseAuthException e) {
//             Get.snackbar('Error Occured', e.code);
//           },
//           codeSent: (String vid, int? token) {
//             Get.to(
//               OtpPage(
//                 vid: vid,
//               ),
//             );
//           },
//           codeAutoRetrievalTimeout: (vid) {});
//     } on FirebaseAuthException catch (e) {
//       Get.snackbar("error Occured", e.code);
//     } catch (e) {
//       Get.snackbar("Error occured", e.toString());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }






