import 'package:cyberchat/Global_Widgets/button.dart';
import 'package:cyberchat/Screen/auth/login.dart';
import 'package:cyberchat/Screen/auth/otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Global_Widgets/textFeild.dart';

class ForgotPass extends StatelessWidget {
  ForgotPass({super.key});
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon:Icon(Icons.arrow_back),onPressed: ()=>Get.back(),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
          Column(

            children: [
              Text("Forgot Password ?",style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold,color: Colors.white),),
              SizedBox(height: 15,),
              Text("Don't worry! It occurs. Please enter the \nemail address linked with your account.",style: TextStyle(fontSize: 15,fontWeight:FontWeight.w400,color: Colors.white.withOpacity(.5)),),
              
            ],
          ),
            SizedBox(height: 30,),
            Column(
              children: [
                CustomTextField(controller: _emailController, hintText: "Type Your Email",prefixIcon: Icon(Icons.email),keyboardType: TextInputType.emailAddress,),
                SizedBox(height: 25,),
                CustomButton(onTap: ()=>Get.to(OTPPage()), text: "Send Code", fontsize: 20, textcolor: Colors.black, bgcolor: Colors.lightGreenAccent, btnheight: 50, btnwidth: 400)
              ],
            ),
            SizedBox(height: 30,),
            Column(
              children: [
                Text("Remember Password ? ",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600), ),
                TextButton(onPressed: ()=>Get.to(LoginPage()), child: Text("Login",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 16
                )),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
