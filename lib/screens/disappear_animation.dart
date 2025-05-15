import 'package:flutter/material.dart';

class DisappearAnimation extends StatelessWidget{
  const DisappearAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: _DisappearAnimationDelegate(maxExtent: 200, minExtent: 120)
          ),
          SliverFillRemaining(
             child: Container(
              color: Colors.blue.shade500,
             ),
          )
        ],
      )
    );
  }
}

class _DisappearAnimationDelegate extends SliverPersistentHeaderDelegate {
  _DisappearAnimationDelegate({
    required this.maxExtent,
    required this.minExtent
  });

  @override
  final double minExtent;
  @override
  final double maxExtent;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double currentHeight = (maxExtent - shrinkOffset).clamp(minExtent, maxExtent);
    //* Rango disponible
    final fadeRange = maxExtent - minExtent;
    /*
      * Cuando scrolleas 20px
      * (1 - (20 / 80 )) = .75 -> un poco visible
      * Cuando scrolleas 60px
      * (1 - (60 / 80 )) = .25 -> ya no tan visible
      * Cuando scrolleas 80px
      * (1 - (80 / 80 )) = 0 -> ya NO ES VISIBLE
    */
    final opacity = (1 - (shrinkOffset / fadeRange)).clamp(0.0, 1.0);

    return Container(
      color: Colors.yellow,
      height: currentHeight,
      child: Container(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Text("Hola", textAlign: TextAlign.center,),
            Opacity(
              opacity: opacity,
              child: Text("Este es el titulo que debe desaparecer", textAlign: TextAlign.center,)
            )
          ],
        )
      ),
    );
  }

  @override
  bool shouldRebuild(covariant _DisappearAnimationDelegate oldDelegate) {
    return oldDelegate.minExtent != minExtent ||
           oldDelegate.maxExtent != maxExtent;
  }
}