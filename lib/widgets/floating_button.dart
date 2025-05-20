import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key, required this.routeName});
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.goNamed(routeName),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(40)
        ),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Icon(Icons.question_mark_outlined, color: Colors.white, size: 28,),
      ),
    );
  }
}