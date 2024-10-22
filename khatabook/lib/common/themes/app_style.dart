


import 'package:flutter/material.dart';

class BossAppStyle{


   static ButtonStyle  btnStyle = ButtonStyle( 
                  backgroundColor: WidgetStatePropertyAll(Colors.red.shade800),
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                  ));
}