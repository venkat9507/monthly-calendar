
import 'package:flutter/material.dart';




Row PreviousNextButton(dynamic dashboardController,dynamic controller) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      InkWell(
        onTap: (){
          var i = (33 + 35 + 37 + 39 + 41 ) ~/ 5;
          print('i $i');
          controller.validate();

        },
        child: Card(
          color: Color(0xFF178DBC),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Next',style: TextStyle(color: Colors.white),),
          ),
        ),
      )
    ],
  );
}