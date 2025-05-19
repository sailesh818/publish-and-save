import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/wrapper.dart';
//import 'package:flutter_application_1/pages/wrapper.dart';
import 'package:get/get.dart';
//import 'package:get/get_core/src/get_main.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  TextEditingController email = TextEditingController();

  void Reset() async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
    Get.offAll(Wrapper());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: email,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
          SizedBox(height: 25),
          ElevatedButton(
            onPressed: () => Reset(),
            child: Text('Forgot Password'),
          ),
        ],
      ),
    );
  }
}
