import 'package:flutter/material.dart';

//Tipos de animaciones
enum AnimationType {
  normal,
  fadeIn,
}

//Clase para manejar las transiciones de las rutas
class RouteTransitions {
  final BuildContext context;
  final Widget child;
  final AnimationType animation;
  final Duration duration;
  final bool replecement;

  RouteTransitions({
    required this.context,
    required this.child,
    this.replecement = false,
    this.animation = AnimationType.normal,
    this.duration = const Duration(milliseconds: 300),
  }) {
    switch (animation) {
      case AnimationType.normal:
        _normalTransition();
        break;
      case AnimationType.fadeIn:
        _fadeInTransition();
        break;
    }
  }
  // Push normal de la pagina
  void _pushPage(Route route) => Navigator.push(context, route);

  // Push replacement de la pagina
  void _pushReplacement(Route route) =>
      Navigator.pushReplacement(context, route);

  //Codigo de una transicion normal
  void _normalTransition() {
    final router = MaterialPageRoute(builder: (_) => child);
    (replecement) ? _pushReplacement(router) : _pushPage(router);
  }
 
  //Controlador de la trasicion con FadeIn
  void _fadeInTransition() {
    final router = PageRouteBuilder(
        pageBuilder: (_, __, ___) => child,
        transitionDuration: duration,
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeOut,
              ),
            ),
            child: child,
          );
        });
    (replecement) ? _pushReplacement(router) : _pushPage(router);
  }
}
