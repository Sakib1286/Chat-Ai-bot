import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
   ChatWidget({super.key, required this.msg, required this.chatIndex, });

  final String msg;
  final int chatIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
  children: [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          chatIndex ==0 ? Image.asset("assets/images/ai.jpg",height: 30,width: 30,):Image.asset("assets/images/bot1.png",height: 30,width: 30,),

          SizedBox(width: 10,),
          Expanded(child: Text(msg,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w400),)),
          chatIndex ==0? const SizedBox.shrink():
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,

              )
        ],
      ),
    )
  ],
);


  }
}
