import 'package:cyberchat/Global_Widgets/button.dart';
import 'package:cyberchat/Screen/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class VerifiedPage extends StatelessWidget {
  const VerifiedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: LottieBuilder.asset("assets/images/verAnimi.json"),
            ),

            Column(
              children: [
                Text("Password Changed !",style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold),),
                SizedBox(height: 15,),
                Text("Your Password Changed Successfully",style: TextStyle(fontSize: 16,fontWeight:FontWeight.w400,color: Colors.black.withOpacity(.5)),),
                SizedBox(height: 30,),
                CustomButton(onTap: ()=>Get.to(LoginPage()), text: "Back To Login", fontsize: 20, textcolor: Colors.black, bgcolor: Colors.lightGreenAccent, btnheight: 50, btnwidth: 400)
              ],
            )



          ],
        ),
      ),
      
      
    );
  }
}
