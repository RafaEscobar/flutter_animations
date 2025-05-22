import 'package:animations/screens/animations/move_text_screen.dart';
import 'package:animations/screens/animations/reduce_scroll_screen.dart';
import 'package:animations/screens/guides/move_text_guide.dart';
import 'package:animations/screens/guides/reduce_scroll_guide.dart';
import 'package:animations/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  //* Método static llamado getRoutes que nos devuelve un RouterConfig<Object>? (opcionalmente) y que recibe por parámetro un GlobalKey<NavigatorState>
  //* 1 Se define una lista de RouteBase llamada routes []
    //** 1.1 Se define un GoRoute con la ruta inicial y a partir del cual se genera el árbol de rutas
      //* 1.1.1 El Builder de cada GoRoute siempre se construye con una función a la que le pasamos un BuilderContext y un GoRouterState como argumentos
  //* 2 Finalmente, este método retorna el "GoRouter" con las rutas y el navigatorKey asignados, y opcionalmente un redirect  (en donde definimos ciertas redirecciones dadas ciertas circunstancias)
  static RouterConfig<Object>? getRoutes(GlobalKey<NavigatorState> navigatorKey) {
    List<RouteBase> routes = [
      GoRoute(
        path: "/",
        builder: (BuildContext context, GoRouterState state) => HomeScreen(),
        routes: [
          GoRoute(
            path: ReduceScrollScreen.routeName,
            name: ReduceScrollScreen.routeName,
            builder: (BuildContext context, GoRouterState state) => ReduceScrollScreen(),
            routes: [
              GoRoute(
                path: ReduceScrollGuide.routeName,
                name: ReduceScrollGuide.routeName,
                builder: (BuildContext context, GoRouterState state) => ReduceScrollGuide(),
              )
            ]
          ),
          GoRoute(
            path: MoveTextScreen.routeName,
            name: MoveTextScreen.routeName,
            builder: (BuildContext context, GoRouterState state) => MoveTextScreen(),
            routes: [
              GoRoute(
                path: MoveTextGuide.routeName,
                name: MoveTextGuide.routeName,
                builder: (BuildContext context, GoRouterState state) => MoveTextGuide(),
              )
            ]
          )
        ]
      )
    ];

    return GoRouter(
      routes: routes,
      navigatorKey: navigatorKey
    );
  }
}