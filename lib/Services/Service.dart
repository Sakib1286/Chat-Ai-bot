
import 'package:cyberchat/Screen/auth/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

bool isSwitch = false;

class Service {
  static Future<void> showModelSheet({required BuildContext context}) async {
    await showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    SizedBox(
                      width: 10,
                    ),

                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                // Row(
                //   children: [
                //     Text("Light Mode"),
                //     Switch(
                //         value: isSwitch,
                //         onChanged: (Value) {
                //           StepState((){
                //             isSwitch = value;
                //           });
                //         }),
                //   ],
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                TextButton(
                    onPressed: () {
                      Get.changeTheme(ThemeData.light());
                    },
                    child: Text("Light Mode")),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () {
                      Get.changeTheme(ThemeData.dark());
                    },
                    child: Text("Dark Mode")),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Get.offAll(LoginPage());
                    },
                    child: Text(
                      "Logout",
                      style: TextStyle(color: Colors.red),
                    )),
              ],
            ),
          );
        });
  }
}
