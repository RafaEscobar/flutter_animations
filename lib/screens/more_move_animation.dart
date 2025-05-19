import 'package:flutter/material.dart';

class MoreMoveAnimation extends StatelessWidget{
  const MoreMoveAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: _MoreMoveAnimationDelegate(maxExtent: 200, minExtent: 120)
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

class _MoreMoveAnimationDelegate extends SliverPersistentHeaderDelegate {
  _MoreMoveAnimationDelegate({
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

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      height: currentHeight,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Título'),
          SizedBox(width: 12),
          Text('Subtítulo'),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant _MoreMoveAnimationDelegate oldDelegate) {
    return oldDelegate.maxExtent != maxExtent || oldDelegate.minExtent != minExtent;
  }
}