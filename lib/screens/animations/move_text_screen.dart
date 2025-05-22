import 'package:animations/screens/guides/move_text_guide.dart';
import 'package:animations/widgets/floating_button.dart';
import 'package:flutter/material.dart';

class MoveTextScreen extends StatelessWidget{
  const MoveTextScreen({super.key});
  static const String routeName = 'move-text-screen';

  //* 1. Definimos un build con un CustomScrollView y un slivers como ya hemos visto previamente
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: _MoveTextScreenDelegate(maxExtent: 200, minExtent: 120)
            ),
            SliverFillRemaining(
              child: Container(
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingButton(routeName: MoveTextGuide.routeName)
    );
  }
}

//* 2. La clase que hereda de SliverPersistentHeaderDelegate igual permanece sin cambios
class _MoveTextScreenDelegate extends SliverPersistentHeaderDelegate {
  _MoveTextScreenDelegate({
    required this.maxExtent,
    required this.minExtent
  });
  @override
  final double maxExtent;
  @override
  final double minExtent;

  //* 3. El método buil es el que si sufre cambios:
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent){
    //* 3.1 Definimos con normalidad el currentHeight para la altura dinámica del contenedor
    final double currentHeight = (maxExtent - shrinkOffset).clamp(minExtent, maxExtent);
    //* 3.2 Obtenemos el rango disponible (altura máxima - altura máxima): Ejemplo: 200 - 120 = 80
    final fadeRange = maxExtent - minExtent;
    //* 3.3 Es un valor normalizado entre 0 y 1 que va aumentando o disminuyendo con base el scroll y el fadeRange
    //* el cual usamos para dar un valor dinámico a la coordenada x del Alingment y así desplazar el texto
    final t = (shrinkOffset / fadeRange).clamp(0.0, 1.0);

    //* 3.4 Definimos tamaño de fuente minimo y un tamaño máximo
    final maxSize = 24;
    final minSize = 12;
    final fontSize = maxSize - (maxSize - minSize) * t;

    //* 3.5 Almacenamos en una variable independiente los valores de las coordenadas X para el texto 1 y el 2
    //* El texto 1 ira hacia la izq es por eso que t se toma como negativo (desplazamiento de x hacia la izq)
    //* El texto 2 ira hacia la derecha es por eso que t se toma como positivo (desplazamiento de x hacia la derecha)
    final text1X = -t;
    final text2X = t;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      height: currentHeight,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //* 4 Envolvemos los Text en Align y definimos un Alignment(x, y) para pasarle el valor dinámico de X y así puedan desplazarse según el scroll
          //* 5 Así mismo pasamos el tamaño dinámico del texto para que reduzca o vuelva a su tamaño normal según corresponda.
          Align(
            alignment: Alignment(text1X, 0),
            child: Text('<- Hacía la izq', style: TextStyle(fontSize: fontSize),)
          ),
          SizedBox(height: 4),
          Align(
            alignment: Alignment(text2X, 0),
            child: Text('Hacia la der ->'),
          ),
          SizedBox(height: 12),
          Text("Valor de X para texto 1: (${text1X.toStringAsFixed(2)}, 0)"),
          Text("Valor de X para texto 2: (${text2X.toStringAsFixed(2)}, 0)")
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant _MoveTextScreenDelegate oldDelegate) {
    return oldDelegate.maxExtent != maxExtent || oldDelegate.minExtent != minExtent;
  }
}