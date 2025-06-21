import 'package:flutter/material.dart';

abstract class Styles {
  static const TextStyle style25 = TextStyle(
    color: Colors.black,
    fontSize: 25,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    height: 0,
  );

  static const TextStyle style18 = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    height: 0,
  );

  static const TextStyle styleBold18 = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    height: 0,
  );
  static const TextStyle style24 = TextStyle(
    color: Colors.black,
    fontSize: 24,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    height: 0,
  );

  static TextStyle style20 = TextStyle(
    color: Colors.black.withValues(alpha: 204), // 0.8 * 255 = 204
    fontSize: 20,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    height: 0,
  );

  static const TextStyle style22 = TextStyle(
    color: Colors.black,
    fontSize: 22,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    height: 0,
  );
}