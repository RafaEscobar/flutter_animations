import 'package:animations/enums/animation_types.dart';
import 'package:animations/widgets/simple_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});
  static const String routeName = 'home-screen';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text("Animaciones disponibles", style: TextStyle(fontSize: 26, fontWeight: FontWeight.w300),),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: AnimationTypes.values.length,
                    itemBuilder: (BuildContext context, int index) => SimpleCard(type: AnimationTypes.values[index]),
                  ),
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}