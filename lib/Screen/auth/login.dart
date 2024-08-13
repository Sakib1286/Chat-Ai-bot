import 'dart:io';

import 'dart:io';

import 'package:cyberchat/Global_Widgets/button.dart';
import 'package:cyberchat/Global_Widgets/textFeild.dart';
import 'package:cyberchat/Screen/Home1.dart';
import 'package:cyberchat/Screen/auth/forgot_pass.dart';
import 'package:cyberchat/Screen/auth/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "Welcome Back,\nGlad to See You,Again ! ",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomTextField(
                        controller: _emailController,
                        hintText: "Type Your Email",
                        prefixIcon: Icon(Icons.email),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: "Type Your password",
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: Icon(Icons.remove_red_eye_sharp),
                      ),
                      //SizedBox(height: 2),
                      TextButton(
                          onPressed: () => Get.to(ForgotPass()),
                          child: Text(
                            "Forgot Password ?",
                            style: TextStyle(color: Colors.lightGreenAccent),
                          )),

                      SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                          onTap: () => _Login(),
                          text: "Login",
                          fontsize: 20,
                          textcolor: Colors.black,
                          bgcolor: Colors.lightGreenAccent,
                          btnheight: 50,
                          btnwidth: 400),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                            height: 40,
                          ),
                          Text(
                            "Don't Have an Account ? ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                          TextButton(
                            onPressed: () => Get.to(SignupPage()),
                            child: Text("Signup",
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
              )
            ],
          ),
        ),
      ),
    );
  }

  // Login function
  _Login() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    try {
      if (email == '' || password == "") {
        Get.snackbar(
          "Error",
          "Fillup info",
          colorText: Colors.lightGreenAccent,
          backgroundColor: Colors.black,
          icon: const Icon(Icons.add_alert),
        );
        return;
      }

      final cred = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (cred.user != null) {
        password = "";

        //Navigate to ChatScreen
        Get.offAll(HomePage1());

        return "Success";
      }

      return;
    } on FirebaseAuthException catch (e) {
      // Navigator.pop(context);

      {
        Get.snackbar(
          "Alart",
          "Unwanted Error",
          colorText: Colors.lightGreenAccent,
          backgroundColor: Colors.black,
          icon: const Icon(Icons.add_alert),
        );
        print(e);
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
