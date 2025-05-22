import 'package:flutter/material.dart';
import 'package:widget_zoom/widget_zoom.dart';

class MoveTextGuide extends StatelessWidget{
  const MoveTextGuide({super.key});
  static const String routeName = 'move-text-guide';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:  SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "¿Como hacer esta animación?",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w200 ),
                ),
                SizedBox(height: 18,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "1. Definimos un build con un CustomScrollView y un slivers como ya hemos visto previamente",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: WidgetZoom(
                      heroAnimationTag: 'animation_one',
                      zoomWidget: Image.asset("assets/images/2/animation_one.jpeg", fit: BoxFit.cover,),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "2. La clase que hereda de SliverPersistentHeaderDelegate igual permanece sin cambios",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: WidgetZoom(
                      heroAnimationTag: 'animation_two',
                      zoomWidget: Image.asset("assets/images/2/animation_two.jpeg", fit: BoxFit.cover,),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "3. El método buil es el que si sufre cambios:",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 20,),
                      Text(
                        "3.1 Definimos con normalidad el currentHeight para la altura dinámica del contenedor",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 14,),
                      Text(
                        "3.2 (fadeRange) Es el rango disponible (altura máxima - altura máxima): Ejemplo: 200 - 120 = 80",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 14,),
                      Text(
                        "3.3 (t) Es un valor normalizado entre 0 y 1 que va aumentando o disminuyendo con base el scroll y el fadeRange el cual usamos para dar un valor dinámico a la coordenada x del Alingment y así desplazar el texto",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: WidgetZoom(
                      heroAnimationTag: 'animation_three',
                      zoomWidget: Image.asset("assets/images/2/animation_three.jpeg", fit: BoxFit.cover,),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "3.4 Definimos tamaño de fuente minimo y un tamaño máximo",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 10,),
                      Text(
                        "3.5 Almacenamos en una variable independiente los valores de las coordenadas X para el texto 1 y el 2",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 10,),
                      Text(
                        "> El texto 1 ira hacia la izq es por eso que t se toma como negativo (desplazamiento de x hacia la izq)",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        "> El texto 2 ira hacia la derecha es por eso que t se toma como positivo (desplazamiento de x hacia la derecha)",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "4. Envolvemos los Text en Align y definimos un Alignment(x, y) para pasarle el valor dinámico de X y así puedan desplazarse según el scroll",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 16,),
                      Text(
                        "5. Así mismo pasamos el tamaño dinámico del texto para que reduzca o vuelva a su tamaño normal según corresponda.",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: WidgetZoom(
                      heroAnimationTag: 'animation_five',
                      zoomWidget: Image.asset("assets/images/2/animation_five.png", fit: BoxFit.cover,),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}