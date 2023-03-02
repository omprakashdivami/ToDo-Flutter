import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:users/screens/formscreen.dart';
class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
   void initState() {
  super.initState();
  Timer(Duration(seconds: 3), () =>(Navigator.push(context, MaterialPageRoute(builder: (context)=> const Formscreen()))));
    
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      body: Center(child: Text("Namasthey",style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 251, 206, 71),
          shadows: <Shadow>[
      Shadow(
        offset: Offset(2.0, 2.0),
        blurRadius: 3.0,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      Shadow(
        offset: Offset(2.0, 2.0),
        blurRadius: 8.0,
        color: Color.fromARGB(125, 0, 0, 255),
      ),
    ], ),)),
      backgroundColor: Color.fromARGB(161, 240, 101, 191),
    );
  }
}