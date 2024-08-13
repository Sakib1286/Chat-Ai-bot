

import 'package:flutter/material.dart';

List<String> models= [
  'Model1',
  'Model2',
  'Model3',
  'Model4',
  'Model5',
];

List<DropdownMenuItem<String>>?get getsModelItem{
  List<DropdownMenuItem<String>>? modelsItem=
  List<DropdownMenuItem<String>>.generate(

    models.length,

      (index)=>DropdownMenuItem(
          value: models[index],
          child: Text(models[index],style: TextStyle(fontSize: 15,color: Colors.white),))
  );
  return modelsItem;
}

final chatMessege =[
  {
    "msg":"Hello Who are you",
    "chatIndex":0
  },
  {
    "msg":"Are you alive",
    "chatIndex":1
  },
  {
    "msg":"Flutter is Good Carieer ",
    "chatIndex":2
  },
  {
    "msg":"What is Provider ",
    "chatIndex":3
  },
  {
    "msg":"What is getX ",
    "chatIndex":4
  },
  {
    "msg":"What is getX ",
    "chatIndex":5
  },
  {
    "msg":"What is getX ",
    "chatIndex":6
  },

];