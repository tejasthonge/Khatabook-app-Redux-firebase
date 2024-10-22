


import 'package:flutter/material.dart';

class AppTheme{


  static ThemeData appTheme  = ThemeData( 

    inputDecorationTheme: InputDecorationTheme( 
      border: OutlineInputBorder( 

         borderRadius: BorderRadius.circular(12),
         borderSide: BorderSide( color: Colors.grey)
      ),
      focusedBorder:  OutlineInputBorder( 

         borderRadius: BorderRadius.circular(12),
         borderSide: BorderSide( color: const Color.fromARGB(255, 143, 135, 135))
      ),
       errorBorder:  OutlineInputBorder( 

         borderRadius: BorderRadius.circular(12),
         borderSide: BorderSide( color: const Color.fromARGB(255, 245, 1, 1))
      )
    )
  );
}