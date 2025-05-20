import 'package:animations/enums/animation_types.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SimpleCard extends StatelessWidget{
  const SimpleCard({super.key, required this.type, });
  final AnimationTypes type;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.goNamed(type.route),
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Text(
                type.description,
                style: TextStyle(fontWeight: FontWeight.w200, fontSize: 22),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Icon(Icons.arrow_forward_ios_rounded, size: 26, color: Colors.black38,)
          ],
        ),
      ),
    );
  }
}