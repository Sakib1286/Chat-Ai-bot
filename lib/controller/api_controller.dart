import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberchat/Services/Api_const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class ApiController extends GetxController {
  final _controller = TextEditingController();

  List data = [];

  bool isLoading = false;
  get controller => _controller;

  // Input Data
  void onSubmit(val) {
    _controller.text = val;
  }

  void addPrompt(val) {
    final userid = FirebaseAuth.instance.currentUser!.uid;
    try{
      FirebaseFirestore.instance.collection("users")
          .doc(userid)
          .collection('Data')
          .add(val)
          .then((val){
            print("Data Added0");
      }).catchError((e,trace){
        print("Error : $e");

      });

    }catch(e){
      print ("Error : $e");
    }

    data.add(val);
  }

  //This function helps to sent prompt data on Firebase.
  Future sendPrompt() async {
    isLoading = true;
    try {
      //String API_KEY = dotenv.get("API_Host",fallback: '');
      var response = await http.post(
          Uri.parse(
            "https://generativelanguage.googleapis.com/v1/models/gemini-pro:generateContent?key=${dotenv.env["API_KEY"]}",
          ),
          headers: {
            "Content-Type": "application/json",
            "x-goog-api-key": "${dotenv.env["API_KEY"]}"
          },
          body: jsonEncode({
            "contents": [
              {
                "role": "user",
                "parts": [
                  {"text": _controller.text}
                ]
              }
            ]
          }));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var prompt = {
          "idx": 1,
          "msg": data["candidates"][0]["content"]["parts"][0]["text"],
          "date": DateTime.now()
        };
        isLoading = false;
        addPrompt(prompt);

        _controller.clear();
        return;
      }

      return;
    } on SocketException catch (e) {
      isLoading = false;
      if (kDebugMode) {
        print(e.toString());
      }
      return;
    } catch (e) {
      isLoading = false;
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
