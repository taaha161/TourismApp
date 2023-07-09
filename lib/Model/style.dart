import 'package:flutter/material.dart';

class Style {
  static const _fontfamily = "Bebas Neue";

  static TextStyle headingStyle() {
    return const TextStyle(
        fontFamily: _fontfamily, fontSize: 25, fontWeight: FontWeight.bold);
  }

  static TextStyle bodyStyle() {
    return const TextStyle(
        fontFamily: _fontfamily, fontSize: 15, fontWeight: FontWeight.normal);
  }

  static TextStyle navStyle() {
    return const TextStyle(
        fontFamily: _fontfamily, fontSize: 20, fontWeight: FontWeight.normal);
  }
}
