import 'package:flutter/material.dart';

/// [DiagonalPathClipperOne], can be used with [ClipPath] widget, and clips the widget diagonally

class CustomeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0.0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 30.0)
      ..quadraticBezierTo(size.width, 0.0, size.width - 100.0, 0.0)
      ..lineTo(50.0, 70.0)
      ..quadraticBezierTo(0.0, 90.0, 0.0, 120.0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
