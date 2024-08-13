import 'package:cyberchat/controller/api_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool? isObscureText;
  final String? obscuringCharacter;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  CustomTextField(
      {super.key,
      required this.controller,
      this.keyboardType,
      this.isObscureText = false,
      this.obscuringCharacter = "*",
      required this.hintText,
      this.prefixIcon,
      this.suffixIcon});

  final apicontroller = Get.put(ApiController());
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isObscureText!,
      obscuringCharacter: obscuringCharacter!,
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
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black.withOpacity(.5)),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(color: Colors.black, width: 1.0)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.0,
              ))),
    );
  }
}
