// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:timesheet_overtime/GlobalVariables.dart';
import 'package:timesheet_overtime/Login/Login.dart';
import 'package:flutter_social_button/flutter_social_button.dart';

class MobileLogin extends StatefulWidget {
  const MobileLogin({super.key});

  @override
  State<MobileLogin> createState() => _MobileLoginState();
}

class _MobileLoginState extends State<MobileLogin> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(mobileVariables.padding * 2),
        padding: EdgeInsets.all(mobileVariables.padding),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Sign In",
              style: TextStyle(fontSize: mobileVariables.headingTextSize, color: primaryColor),
            ),
            Text(
              "Stay up to date with your work",
              style: TextStyle(fontSize: mobileVariables.bodyTextSize, color: secondaryColor),
            ),
            SizedBox(height: 20),
            TextField(
              controller: LoginVAF.emailController,
              decoration: InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(
                  color: primaryColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: primaryColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: primaryColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              onSubmitted: (value) async {
                try {
                  setState(() {
                    LoginVAF.signIn();
                  });
                } on Exception catch (e) {
                  if (kDebugMode) {
                    print(e);
                  }
                  setState(() {});
                }
              },
              controller: LoginVAF.passwordController,
              obscureText: !LoginVAF.passwordVisible,
              obscuringCharacter: "*",
              decoration: InputDecoration(
                labelText: "Password",
                labelStyle: TextStyle(
                  color: primaryColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: primaryColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: primaryColor,
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    LoginVAF.passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: primaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      LoginVAF.passwordVisible = !LoginVAF.passwordVisible;
                    });
                  },
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text("Forgot Password?", style: TextStyle(color: Colors.grey)),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    setState(() {
                      LoginVAF.signIn();
                    });
                  } catch (e) {
                    if (kDebugMode) {
                      print(e);
                    }
                    setState(() {});
                  }
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(primaryColor),
                ),
                child: Text(
                  LoginVAF.loginText,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: 2,
                  color: Colors.grey,
                ),
                Spacer(),
                Text(
                  "or",
                  style: TextStyle(
                    fontSize: mobileVariables.bodyTextSize,
                    color: Colors.grey,
                  ),
                ),
                Spacer(),
                Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: 2,
                  color: Colors.grey,
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.white),
                  side: WidgetStateProperty.all(BorderSide(color: secondaryColor)),
                ),
                icon: Icon(FontAwesomeIcons.google, color: secondaryColor, size: 16),
                label: Text(
                  "Sign In with Google",
                  style: TextStyle(
                    color: secondaryColor,
                  ),
                ),
              ),
            ),
            SizedBox(width: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.25,
              child: Visibility(
                visible: LoginVAF.errorTextVisible,
                child: Text(
                  LoginVAF.errorText,
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
