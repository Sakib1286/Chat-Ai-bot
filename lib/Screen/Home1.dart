//import 'dart:ui_web';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberchat/Global_Widgets/textFeild.dart';
import 'package:cyberchat/Screen/chatWidget.dart';

import 'package:cyberchat/Services/Service.dart';
import 'package:cyberchat/Services/email_verification.dart';
import 'package:cyberchat/controller/api_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cyberchat/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({super.key});

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  final bool _isTyping = true;
  late TextEditingController textEditingController;
  final apiController = Get.put(ApiController());
  final userid = FirebaseAuth.instance.currentUser!.uid;

  final service = EmailVerification();

  @override
  void initState() {
    textEditingController = TextEditingController();
    print("email verification link: ${service.checkEmailVerification()}");
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print(
        "------------------------------------------------------this is the data");
    print("data ${apiController.data}");
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: new Image.asset("assets/images/ai.jpg"),
        ),
        backgroundColor: Colors.lightGreenAccent,
        title: Text(
          "CyberChat",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                await Service.showModelSheet(context: context);
              },
              icon: Icon(
                Icons.more_vert_rounded,
                color: Colors.black,
              ))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Flexible(
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("users")
                          .doc(userid)
                          .collection("Data")
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return SpinKitThreeBounce(
                            color: Colors.lightGreenAccent,
                            size: 18,
                          );
                        }
                        if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        }
                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return const Center(
                              child: Text("Let's Start Chatting With AI"));
                        } else {
                          WidgetsBinding.instance.addPostFrameCallback((_) {});
                          return ListView.builder(
                            itemCount: apiController.data.length,
                            itemBuilder: (context, index) {
                              print(apiController.data[index]);
                              print(
                                  "This is the ISLoading${apiController.isLoading}");
                              return ChatWidget(
                                msg:
                                    apiController.data[index]["msg"].toString(),
                                chatIndex: int.parse(apiController.data[index]
                                        ["idx"]
                                    .toString()),
                              );
                            },
                          );
                        }
                      })),
              if (apiController.isLoading) ...[
                //     SpinKitThreeBounce(
                // color: Colors.lightGreenAccent,
                //       size: 18,
                //     ),
                SizedBox(
                  height: 5,
                ),
              ],
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Expanded(
                      child: TextFormField(
                    controller: apiController.controller,
                    onChanged: (val) {
                      apiController.onSubmit(val);
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(12.0),
                        constraints: BoxConstraints(
                          maxHeight: height * 0.065,
                          maxWidth: width,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "How i can help you",
                        hintStyle:
                            TextStyle(color: Colors.black.withOpacity(.5)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            ))),
                  )),
                  IconButton(
                      onPressed: () async {
                        try {
                          var inputTxt = {
                            "idx": 0,
                            "msg": apiController.controller.text,
                            "date": DateTime.now()
                          };

                          apiController.addPrompt(inputTxt);

                          await apiController.sendPrompt();
                        } catch (e) {
                          if (kDebugMode) {
                            print(e.toString());
                          }
                        } finally {
                          print("the data: ${apiController.data.length}");
                        }
                      },
                      icon: Icon(
                        Icons.send,
                        color: Colors.lightGreenAccent,
                      ))
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
