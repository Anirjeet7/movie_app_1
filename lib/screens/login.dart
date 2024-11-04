import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_1/screens/otp.dart'; // Update to your actual OTP screen file location

class PhoneHome extends StatefulWidget {
  const PhoneHome({super.key});

  @override
  State<PhoneHome> createState() => _PhoneHomeState();
}

class _PhoneHomeState extends State<PhoneHome> {
  final TextEditingController phonenumber = TextEditingController();

  // Function to send the OTP code
  Future<void> sendcode() async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91' + phonenumber.text,
        verificationCompleted: (PhoneAuthCredential credential) {
          // Automatically handle sign-in if the OTP is verified instantly
          FirebaseAuth.instance.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          Get.snackbar('Error Occurred', e.message ?? 'An unknown error occurred');
        },
        codeSent: (String vid, int? token) {
          // Navigate to OTP page with the verification ID (vid)
          Get.to(
            OtpPage(
              vid: vid,
            ),
          );
        },
        codeAutoRetrievalTimeout: (String vid) {
          // Handle auto-retrieval timeout
          Get.snackbar('Timeout', 'Please request a new code.');
        },
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error Occurred", e.message ?? 'Unknown error');
    } catch (e) {
      Get.snackbar("Error Occurred", e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Phone Authentication"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter your phone number',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: phonenumber,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
                prefixText: '+91 ',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: sendcode,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text(
                'Send OTP',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
