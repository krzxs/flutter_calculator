import 'package:flutter/material.dart';

// Colors
const Color primaryColor = Color(0xFF6344D4);
const Color secondaryColor = Color(0xFF937CE6);
const Color secondaryColor2 = Color(0xFFC9BAFF);

const _greyPrimaryValue = 0xFFEAEBED;
const MaterialColor grey = MaterialColor(
  _greyPrimaryValue,
  {
    100: Color(0xFFFFFFFF),
    200: Color(_greyPrimaryValue),
    300: Color(0xFF828A93),
    400: Color(0xFF5A6876),
    500: Color(0xFF2E3A48),
    600: Color(0xFF212A35),
    700: Color(0xFF171C22),
  },
);

// Gradients
const LinearGradient primaryGradient = LinearGradient(
  colors: [
    Color(0xFFA430FF),
    Color(0xFFF318AD),
    Color(0xFFFF2171),
  ],
);