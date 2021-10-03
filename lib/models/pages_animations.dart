import 'package:flutter/material.dart';

class PagesAnimations extends PageRouteBuilder {
  final Widget page;

  PagesAnimations({required this.page})
      : super(
            pageBuilder: (_, animation1, animation2) => page,
            transitionsBuilder: (_, animation1, animation2, child) {
              Tween<Offset> tween =
                  Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0));
              Animation<Offset> animationOffset = animation1.drive(tween);
              return SlideTransition(
                position: animationOffset,
                child: child,
              );
            });
}
