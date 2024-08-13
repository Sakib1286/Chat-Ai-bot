import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final  Color textcolor;
  final double fontsize;
  final Color bgcolor;
  final double btnheight;
  final double btnwidth;


  const CustomButton({super.key, required this.onTap, required this.text, required this.fontsize, required this.textcolor, required this.bgcolor, required this.btnheight, required this.btnwidth});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onTap,
      style:ElevatedButton.styleFrom (
      minimumSize:Size(btnwidth ?? MediaQuery.of(context).size.width,btnheight ?? MediaQuery.of(context).size.height * 0.06, ),
     backgroundColor: bgcolor,
        elevation: 1.0,
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        )
      ),
      child: Text(text,
        style: TextStyle(
          color: textcolor,
          fontSize: fontsize
        ),

          ),



    );
  }
}




