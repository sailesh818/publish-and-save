import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/forgot_page.dart';
import 'package:flutter_application_1/pages/sign_up.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({super.key});

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  final email = TextEditingController();
  final password = TextEditingController();

  void LogIn() {
    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.text,
      password: password.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          children: [
            TextField(
              controller: email,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                hintText: 'Enter Email',
              ),
            ),
            SizedBox(height: 25),
            TextField(
              controller: password,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                hintText: 'Enter Password',
              ),
            ),
            SizedBox(height: 25),
            ElevatedButton(onPressed: () => LogIn(), child: Text('Login')),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: () => Get.to(ForgotPage()),
              child: Text('Forgot Password'),
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: () => Get.to(SignUp()),
              child: Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}
