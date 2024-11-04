// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class OtpPage extends StatefulWidget {
//   final String vid; // Ensure this is a string type for verification ID

//   const OtpPage({super.key, required this.vid});

//   @override
//   State<OtpPage> createState() => _OtpPageState();
// }

// class _OtpPageState extends State<OtpPage> {
//   var code = '';

//   // Method to handle OTP Sign-in
//   Future<void> signIn() async {
//     PhoneAuthCredential credential = PhoneAuthProvider.credential(
//       verificationId: widget.vid,
//       smsCode: code,
//     );

//     try {
//       // Sign-in attempt with the provided OTP code
//       await FirebaseAuth.instance.signInWithCredential(credential);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Sign-in successful!')),
//       );

//       // Navigate to the home screen or any other screen you wish
//       // Navigator.pushReplacementNamed(context, '/home');

//     } catch (e) {
//       // Handle the error if OTP verification fails
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Sign-in failed. Error: ${e.toString()}')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       body: SingleChildScrollView(
//         child: ListView(
//           shrinkWrap: true,
//           children: [
//             const Center(
//               child: Text(
//                 'OTP Verification',
//                 style: TextStyle(fontSize: 30),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 25, vertical: 6),
//               child: Text(
//                 "Enter OTP sent to +91 ",
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             const SizedBox(height: 20),
//             otpTextField(),
//             const SizedBox(height: 80),
//             submitButton(),
//           ],
//         ),
//       ),
//     );
//   }

//   // Button for signing in after entering OTP
//   Widget submitButton() {
//     return Center(
//       child: ElevatedButton(
//         onPressed: signIn,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.blueAccent,
//           padding: const EdgeInsets.all(16),
//         ),
//         child: const Padding(
//           padding: EdgeInsets.symmetric(horizontal: 80),
//           child: Text('Verify OTP',
//               style: TextStyle(fontSize: 18, color: Colors.white)),
//         ),
//       ),
//     );
//   }

//   // Input field for the OTP code
//   Widget otpTextField() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 30.0),
//       child: TextField(
//         keyboardType: TextInputType.number,
//         maxLength: 6,
//         decoration: const InputDecoration(
//           hintText: 'Enter OTP',
//           border: OutlineInputBorder(),
//         ),
//         onChanged: (value) {
//           setState(() {
//             code = value;
//           });
//         },
//       ),
//     );
//   }
// }
