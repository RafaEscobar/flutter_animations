import 'package:flutter/material.dart';

class ShrinkScreen extends StatelessWidget{
  const ShrinkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: _ShrinkHeaderDelegate(maxExtent: 200, minExtent: 120)
        ),
        //* Este widget nos permite estirar el contenido que tenga de tal forma que abarque todo el espacio restante (osease el espacio que nos deje el header)
        SliverFillRemaining(
          child: Container(
            color: Colors.yellow,
          ),
        )
      ],
    );
  }
}

class _ShrinkHeaderDelegate extends SliverPersistentHeaderDelegate {
  _ShrinkHeaderDelegate({
    required this.maxExtent,
    required this.minExtent
  });
  @override
  final double minExtent;
  @override
  final double maxExtent;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    /*
      * Aquí básicamente vamos generando una nueva altura para nuestro container con base
      * en el scroll hecho y limitando dicha altura a la altura mínima y la máxima
    */
    final currentHeight = (maxExtent - shrinkOffset).clamp(minExtent, maxExtent);

    return Container(
      color: Colors.blue,
      height: currentHeight,
    );
  }

  //* Gancho que evita renderizaciones innecesarias.
  //* Si los valores de la instancia actual son distintos a la antigua, se devuelve un true que detona la reconstrucción.
  @override
  bool shouldRebuild(covariant _ShrinkHeaderDelegate oldDelegate) {
    return oldDelegate.minExtent != minExtent ||
           oldDelegate.maxExtent != maxExtent;
  }

}