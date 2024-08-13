import 'package:cyberchat/Global_Widgets/button.dart';
import 'package:cyberchat/Screen/auth/login.dart';
import 'package:cyberchat/Screen/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(


            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
             Center(
               child: Column(

                  
                  children: [
                   Image(image: AssetImage("assets/images/bot1.png"),),
                    Text("CyberChat",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),)]
               ),
             ),
              Column(
                children: [
              CustomButton(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));}, text: "Login", fontsize: 20, textcolor: Colors.black, bgcolor:Colors.lightGreenAccent, btnheight: 50, btnwidth: 330),
              SizedBox(height: 20,),
              CustomButton(onTap: (){Navigator.push(context, MaterialPageRoute(builder:(context)=>SignupPage() ));}, text: "Signup", fontsize: 20, textcolor: Colors.lightGreenAccent, bgcolor:Colors.black, btnheight: 50,btnwidth: 330),
              ]

              ),

            ],
          ),
        ),
      ),
    );
  }
}
