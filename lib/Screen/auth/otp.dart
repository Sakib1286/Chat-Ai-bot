import 'package:cyberchat/Screen/auth/new_pass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Global_Widgets/button.dart';

class OTPPage extends StatelessWidget {
  const OTPPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon:Icon(Icons.arrow_back),onPressed: ()=>Get.back(),),

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
         children: [

            Column(
              children: [
                Text("OTP Varification",style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold),),
                SizedBox(height: 15,),
                Text("Enter the verification code we just \nsent on your email address.",style: TextStyle(fontSize: 15,fontWeight:FontWeight.w400,color: Colors.white.withOpacity(.5)),),

              ],

            ),
           //SizedBox(height:35,),

            Column(
              children: [
                Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomOTPButton(),
                    SizedBox(width: 10,),
                    CustomOTPButton(),
                    SizedBox(width: 10,),
                    CustomOTPButton(),
                    SizedBox(width: 10,),
                    CustomOTPButton(),
                    SizedBox(width: 10,),

                  ],
                ),
                SizedBox(height: 15,),
                CustomButton(onTap: ()=>Get.to(ChangePass()), text: "Varify", fontsize: 20, textcolor: Colors.black, bgcolor: Colors.lightGreenAccent, btnheight: 50, btnwidth: 400),
              ],
            ),
           Column(
children: [
  Text("Didn't Recieve Code",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600), ),
  TextButton(onPressed: (){}, child: Text("Resend",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 16
  )),)
],
           )
          ],
        ),
      ),
    );
  }
}

class CustomOTPButton extends StatelessWidget {
  const CustomOTPButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      width: 60,
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: Colors.lightGreenAccent
            )

          ),
          enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.0),
    borderSide: BorderSide(
    color: Colors.lightGreenAccent
    ))
        ),
      ),
    );
  }
}


