import 'package:cyberchat/Global_Widgets/button.dart';
import 'package:cyberchat/Global_Widgets/textFeild.dart';
import 'package:cyberchat/Screen/auth/forgot_pass.dart';
import 'package:cyberchat/Screen/auth/signup.dart';
import 'package:cyberchat/Screen/auth/verified.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class ChangePass extends StatelessWidget {
  ChangePass({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon:Icon(Icons.arrow_back),onPressed: ()=>Get.back(),),
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
                  Text("Create New Password",style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold),),
                  SizedBox(height: 15,),
                  Text("Your new password must be unique from those previously used.",style: TextStyle(fontSize: 15,fontWeight:FontWeight.w400,color: Colors.white.withOpacity(.5)),),
                  SizedBox(height: 25,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomTextField(controller: _passwordController, hintText: "New Password",),
                      SizedBox(height: 30,),
                      CustomTextField(controller: _passwordController, hintText: "Re-Type password",),



                      SizedBox(height: 30,),
                      CustomButton(onTap: ()=>Get.to(VerifiedPage()), text: "Reset Password", fontsize: 20, textcolor: Colors.black, bgcolor: Colors.lightGreenAccent, btnheight: 50, btnwidth: 400),

                    ],
                  ),


                ],

              )

            ],

          ),
        ),
      ),
    );
  }
}
