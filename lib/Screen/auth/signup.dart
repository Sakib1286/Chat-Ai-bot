import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberchat/Global_Widgets/button.dart';
import 'package:cyberchat/Global_Widgets/textFeild.dart';
import 'package:cyberchat/Screen/auth/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class SignupPage extends StatefulWidget {
  SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _username = TextEditingController();

  TextEditingController _emailController = TextEditingController();

  TextEditingController _password = TextEditingController();

  TextEditingController _CPassword = TextEditingController();

  @override
  void dispose() {
    _username.dispose();
    _emailController.dispose();
    _password.dispose();
    _CPassword.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    "Hello ! Signup to Get Started !",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  CustomTextField(controller: _username, hintText: "Username"),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                      controller: _emailController, hintText: "Email"),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(controller: _password, hintText: "Password"),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                      controller: _CPassword, hintText: "Confirm Password"),
                  SizedBox(
                    height: 25,
                  ),
                  CustomButton(
                      onTap: _Signup,
                      text: "Signup",
                      fontsize: 20,
                      textcolor: Colors.lightGreenAccent,
                      bgcolor: Colors.black,
                      btnheight: 50,
                      btnwidth: 400),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Text("Or login with"),
                  SizedBox(
                    height: 5,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialLoginButton(
                        buttonType: SocialLoginButtonType.google,
                        onPressed: () {},
                        borderRadius: 20,
                        height: 40,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SocialLoginButton(
                        buttonType: SocialLoginButtonType.facebook,
                        onPressed: () {},
                        borderRadius: 20,
                        height: 40,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SocialLoginButton(
                        buttonType: SocialLoginButtonType.apple,
                        onPressed: () {},
                        borderRadius: 20,
                        height: 40,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Already Have an Account ? ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      TextButton(
                        onPressed: () => Get.to(LoginPage()),
                        child: Text("Login",
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _Signup() async {
    String username = _username.text;
    String email = _emailController.text;
    String password = _password.text;
    String CPassword = _CPassword.text;

    try {
      if (password != CPassword) {
        Get.snackbar(
          "Error",
          "Conform your Password",
          colorText: Colors.lightGreenAccent,
          backgroundColor: Colors.black,
          icon: const Icon(Icons.add_alert),
        );
        return;
      }
      if (email == '' || password == "" || username == "" || CPassword == '') {
        Get.snackbar(
          "Error",
          "Fillup info",
          colorText: Colors.lightGreenAccent,
          backgroundColor: Colors.black,
          icon: const Icon(Icons.add_alert),
        );
        return;
      }

      final cred = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (cred.user != null) {
        //Store The Data
        await cred.user!.sendEmailVerification();
        print('Verification email sent');

        //Update DisplayName
        await FirebaseAuth.instance.currentUser!.updateDisplayName(username);

        // Create an user Collection
        await FirebaseFirestore.instance
            .collection("users")
            .doc(cred.user!.uid)
            .set({"name": username, "email": email, "password": password});

        //Navigate to ChatScreen

        Get.offAll(LoginPage());

        return "Success";
      }

      return;
    } on FirebaseAuthException catch (e) {
      // Navigator.pop(context);

      if (e.code == 'weak-password') {
        Get.snackbar(
          "Week Password",
          "Use minimum 6 character",
          colorText: Colors.lightGreenAccent,
          backgroundColor: Colors.black,
          icon: const Icon(Icons.add_alert),
        );
        return;
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          "Alart",
          "Email Already Exist ! Try with new Email or click Forget password",
          colorText: Colors.lightGreenAccent,
          backgroundColor: Colors.black,
          icon: const Icon(Icons.add_alert),
        );

        return;
      } else {
        Get.snackbar(
          "Alart",
          "Unwanted Error",
          colorText: Colors.lightGreenAccent,
          backgroundColor: Colors.black,
          icon: const Icon(Icons.add_alert),
        );
        return print(e.message);
      }
    } on SocketException catch (e) {
      Get.snackbar(
        "Alart",
        "Error 404",
        colorText: Colors.lightGreenAccent,
        backgroundColor: Colors.black,
        icon: const Icon(Icons.add_alert),
      );
    } catch (e) {
      Get.snackbar(
        "Alart",
        "Error Occur",
        colorText: Colors.lightGreenAccent,
        backgroundColor: Colors.black,
        icon: const Icon(Icons.add_alert),
      );
    }
  }
}
