import 'package:flutter/material.dart';

class BossAppStyle {
  static ButtonStyle btnStyle = ButtonStyle(
    // padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 25)),
  minimumSize: WidgetStatePropertyAll(Size(double.infinity,50)),
      backgroundColor: WidgetStatePropertyAll(Colors.red.shade800),
      foregroundColor: WidgetStatePropertyAll(Colors.white),
      shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))));
}
