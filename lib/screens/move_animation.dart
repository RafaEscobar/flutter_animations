import 'package:flutter/material.dart';

class MoveAnimation extends StatelessWidget{
  const MoveAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: _MoveAnimationDelegate(maxExtent: 200, minExtent: 120)
          ),
          SliverFillRemaining(
            child: Container(
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}

class _MoveAnimationDelegate extends SliverPersistentHeaderDelegate {
  _MoveAnimationDelegate({
    required this.maxExtent,
    required this.minExtent
  });
  @override
  final double maxExtent;
  @override
  final double minExtent;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent){
    final double currentHeight = (maxExtent - shrinkOffset).clamp(minExtent, maxExtent);
    final fadeRange = maxExtent - minExtent;
    final t = (shrinkOffset / fadeRange).clamp(0.0, 1.0);
    //* t: (20 / 80) == .25
    //* fontSize: (24 - (24 - 12)) = 12 | 12 * .25 = 21
    // !
    //* t: 60 / 80 == .75
    //* fontSize: (24 - (24 - 12)) = 12 | 12 * .75 = 9 (9 se devuelve como 12 por el clamp) == 12
    final maxSize = 24;
    final minSize = 12;
    final fontSize = maxSize - (maxSize - minSize) * t;

    final alignmentX = -t;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      height: currentHeight,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //* fadeRange: 200 - 120 = 80
          //* t: (20/80) = 0.25
          //* alignmentX = -0.25
          //* Alignment(-0.25, 0), -> Se desplaza ese porcentaje hacia la izquierda ya que x+ => derecha | x- => izquierda
          Align(
            alignment: Alignment(alignmentX, 0),
            child: Text('Título', style: TextStyle(fontSize: fontSize),)
          ),
          SizedBox(width: 12),
          Align(
            alignment: Alignment(alignmentX * -1, 0),
            child: Text('Subtítulo'),
          ),
          Text(alignmentX.toStringAsFixed(2))
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant _MoveAnimationDelegate oldDelegate) {
    return oldDelegate.maxExtent != maxExtent || oldDelegate.minExtent != minExtent;
  }
}