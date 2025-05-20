import 'package:animations/screens/animations/move_text_screen.dart';
import 'package:animations/screens/animations/reduce_scroll_screen.dart';

enum AnimationTypes {
  reduceScroll,
  moveTextWithScroll,
  reduceTextWithScroll
}

extension AnimationTypesExtension on AnimationTypes {
  String get description {
    switch(this) {
      case AnimationTypes.reduceScroll:
        return "Reducir tamaño de caja con scroll";
      case AnimationTypes.moveTextWithScroll:
        return "Mover texto hacia los costados con scroll";
      case AnimationTypes.reduceTextWithScroll:
        return "Reducir tamaño del texto con scroll";
    }
  }

  String get route {
    switch(this) {
      case AnimationTypes.reduceScroll:
        return ReduceScrollScreen.routeName;
      case AnimationTypes.moveTextWithScroll:
        return MoveTextScreen.routeName;
      case AnimationTypes.reduceTextWithScroll:
        return "-";
    }
  }
}