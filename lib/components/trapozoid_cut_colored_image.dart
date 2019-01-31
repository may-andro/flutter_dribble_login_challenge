import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class TrapozoidTopBar extends StatelessWidget {
  TrapozoidTopBar({@required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return new ClipPath(
      clipper: new DiagonalClipper(),
      child: child,
    );
  }
}

class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    path.lineTo(0.0, size.height * 0.9);
    path.lineTo(size.width * 0.18, size.height);
    path.lineTo(size.width * 0.7, size.height);
    path.lineTo(size.width, size.height * 0.7);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
