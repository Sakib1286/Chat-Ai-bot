import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cyberchat/Screen/Home1.dart';
import 'package:cyberchat/Screen/auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../Services/email_verification.dart';

class SplashScreen extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;

  SplashScreen({super.key});
  get splash => null;
  final service = EmailVerification();

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Center(
            child: LottieBuilder.asset("assets/images/animi.json"),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
      nextScreen: user != null ? HomePage1() : Auth(),
      splashIconSize: 400,
    );
  }
}
