import 'package:animations/screens/more_move_animation.dart';
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