// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:timesheet_overtime/Login/DesktopLogin.dart';
import 'package:timesheet_overtime/Login/MobileLogin.dart';
import 'package:timesheet_overtime/Signup/Signup.dart';

class LoginVAF {
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();

  static bool passwordVisible = false;
  static bool errorTextVisible = false;

  static String loginText = "Sign In";
  static String errorText = "";

  static void signIn() async {
    if (kDebugMode) {
      print("Sign In");
      print("Email: ${emailController.text}");
      print("Password: ${passwordController.text}");
    }
    
    loginText = "Signing In";

    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      if (kDebugMode) {
        print("Empty Fields");
      }
      errorText = "Please make sure your Email and Password fields are filled in";
      errorTextVisible = true;
      loginText = "Sign In";
      return;
      // throw "Empty Fields";
    }

    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    if (!emailRegex.hasMatch(emailController.text)) {
      errorText = "Please enter a valid email address";
      errorTextVisible = true;
      loginText = "Sign In";
      return;
      // throw "Invalid Email";
    }

    try {
      
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } catch (e) {
      loginText = "Sign In";
      errorTextVisible = true;
      if (e.toString().contains('[firebase_auth/channel-error] Unable to establish connection on channel.')) {
        errorText = "Please make sure your Email and Password fields are filled in correctly";
      } else if (e.toString().contains('[firebase_auth/invalid-email] The email address is badly formatted.')) {
        errorText = "Please make sure Email is correct";
      } else if (e.toString().contains('[firebase_auth/invalid-credential] The supplied auth credential is incorrect, malformed or has expired.')) {
        errorText = "Your Email or Password is incorrect";
      } else if (e.toString().contains('[firebase_auth/network-request-failed]')) {
        errorText = "Please make sure you are connected to the internet";
      } else {
        errorText = "An unknown error occurred";
      }
      rethrow;
    }
  }

  static void navigateToSignup(context) {
    if (kDebugMode) {
      print("Navigate to Signup");
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Signup(),
      ),
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return const Scaffold(
            body: DesktopLogin(),
          );
        } else {
          return const Scaffold(
            body: MobileLogin(),
          );
        }
      },
    );
  }
}
