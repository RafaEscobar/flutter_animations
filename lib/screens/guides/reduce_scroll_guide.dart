import 'package:flutter/material.dart';
import 'package:widget_zoom/widget_zoom.dart';

class ReduceScrollGuide extends StatelessWidget{
  const ReduceScrollGuide({super.key});
  static const String routeName = 'recude-scroll-guide';

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
                        "1. En nuestro StatelessWidget/StatesfulWidget definimos un CustomScrollView en cuyo slivers[] habrán dos widgets:",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 10,),
                      Text(
                        "> SliverPersistentHeader",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 4,),
                      Text(
                        "> SliverFillRemaining",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: WidgetZoom(
                      heroAnimationTag: 'animation_one',
                      zoomWidget: Image.asset("assets/images/animation_one.jpeg", fit: BoxFit.cover,),
                  ),
                ),
                SizedBox(height: 16,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("NOTAS: ", style: TextStyle(fontSize: 20),),
                      SizedBox(height: 10,),
                      Text(
                        "1.1 El widget SliverPersistentHeader debe tener el pinned en true para que el Header se quede estatico",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 10,),
                      Text(
                        "1.2 El widget SliverFillRemaining sirve para que aquel widget que tenga como hijo se expanda de tal forma que ocupe todo el tamaño disponible que le deje el header",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.justify,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Divider(height: 0.7,),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "2. Definimos una clase que extienda de SliverPersistentHeaderDelegate para definir las metricas del header (altura máxima y mínima)",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: WidgetZoom(
                      heroAnimationTag: 'animation_two',
                      zoomWidget: Image.asset("assets/images/animation_two.jpeg", fit: BoxFit.cover,),
                  ),
                ),
                SizedBox(height: 16,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "2.1 La clase al extender de SliverPersistentHeaderDelegate solicita la sobrescritura de:",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 10,),
                      Text(
                        "> minExtent: Altura mínima",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "> maxExtent: Altura máxima",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "> shouldRebuild",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 14,),
                      Text(
                        "El método *shouldRebuild* es para establecer QUE CONDICIONES SE DEBEN DAR para que se haga una reconstrucción, evitando así renderizaciones innecesarias",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Divider(height: 0.7,),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "3. Como podemos observar el método build recibe como parametros dos elementos más de lo habitual: shrinkOffset y overlapsContent",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 10,),
                      Text(
                        "> shrinkOffset: Nos permite conocer cuando scroll ha dado el usuario",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "> overlapsContent: Es un bool que nos permite saber sí el SliverPersistentHeader está sobreponiéndose o superponiéndose.",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: WidgetZoom(
                      heroAnimationTag: 'animation_three',
                      zoomWidget: Image.asset("assets/images/animation_three.jpeg", fit: BoxFit.cover,),
                  ),
                ),
                SizedBox(height: 10,),
                Divider(height: 0.7,),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "4. Dentro del método build definimos una variable (currentHeight) que ira cambiando dependiendo del scroll dado. Esta variable se le pasara en el height al container y sera la encargada de ir reduciendo o volviendo a la normalidad la altura con base al scroll",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.justify,
                      ),
                      
                    ],
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