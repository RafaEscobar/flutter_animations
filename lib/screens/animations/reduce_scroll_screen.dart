import 'package:flutter/material.dart';

class ReduceScrollScreen extends StatelessWidget{
  const ReduceScrollScreen({super.key});
  static const String routeName = "reduce-scroll-screen";

  @override
  Widget build(BuildContext context) {
    //* 1 Definimos un CustomScrollView
    //* > Los Slivers son: SliverPersistHeader (Para la caja que reduce su tamaño) y SliverFillRemaining (Para la caja a la que se le da scroll)
    //! Es altamente IMPORTANTE dejar el "pinned: true" en true para que el header se quede estatico
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: _ShrinkHeaderDelegate(maxExtent: 200, minExtent: 120)
            ),
            //* SliverFillRemaining nos permite estirar el contenido que tenga de tal forma que abarque todo el espacio restante (osease el espacio que nos deje el header)
            SliverFillRemaining(
              child: Container(
                color: Colors.yellow,
              ),
            )
          ],
        ),
      ),
    );
  }
}

//* 2 Definimos una clase que extiende de SliverPersistentHeaderDelegate para configurar/establecer las métricas del header
//* Debe recibir por parametro la altura máxima y la mínima
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
    //* 2.1 Vamos cambiando dinámicamente la altura de nuestro header con base en el scroll hecho y limitando dicha altura a la altura mínima y la máxima
    final currentHeight = (maxExtent - shrinkOffset).clamp(minExtent, maxExtent);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Colors.blue,
      height: currentHeight,
      child: Column(
        spacing: 6,
        children: [
          Text(
            "Este es el container que se contrae con forme se da scroll",
            style: TextStyle(fontSize: 18, color: Colors.white,),
            textAlign: TextAlign.center,
          ),
          Text(
            "> Altura de este contenedor: ${currentHeight.toStringAsFixed(2)}",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 12),
          ),
          Text(
            "> Scroll dado: ${shrinkOffset.toStringAsFixed(2)}",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 12),
          )
        ],
      )
    );
  }

  //* 2.2 Gancho que evita renderizaciones innecesarias. Si los valores de la instancia actual son distintos a la antigua, se devuelve un true que detona la reconstrucción.
  @override
  bool shouldRebuild(covariant _ShrinkHeaderDelegate oldDelegate) {
    return oldDelegate.minExtent != minExtent ||
           oldDelegate.maxExtent != maxExtent;
  }

}