import 'package:animations/screens/disappear_animation.dart';
import 'package:animations/screens/more_move_animation.dart';
import 'package:animations/screens/move_animation.dart';
import 'package:animations/screens/shrink_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Container(
        color: Colors.white,
        child: SafeArea(
          child: MoreMoveAnimation()
        ),
      )
    );
  }
}