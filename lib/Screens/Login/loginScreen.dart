import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_sc/Controller/Dto/LogIn/GoogleAuth.dart';
import 'package:flutter_sc/Model/common/color.dart';

// Widget for the login screen
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Instance of Dio
  Dio dio = Dio();
  
  // Form key
  final _formKey = GlobalKey<FormState>();

  // Instance related to Google authentication
  GoogleAuth googleAuth = GoogleAuth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARYCOLOR,
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 65),
                SizedBox(
                  width: 200,
                  child: Image.asset('assets/logo.png'),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Stand By Me',
                  style: TextStyle(fontSize: 45, color: MAIN_TEXT_COLOR),
                ),
                const Text(
                  'Foreign community',
                  style: TextStyle(fontSize: 25, color: MAIN_TEXT_COLOR),
                ),
                SizedBox(height: 20),
                // Google login button
                TextButton(
                  onPressed: () async {
                    await googleAuth.handleSignIn(context);
                    context.go('/mainBoard');
                  },
                  child: const Text(
                    "Google Log In",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
                // Google login icon button
                IconButton(
                  onPressed: () async {
                    await googleAuth.handleSignIn(context);
                  },
                  icon: Image.asset(
                    "assets/google.png",
                    width: 60,
                    height: 40,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
