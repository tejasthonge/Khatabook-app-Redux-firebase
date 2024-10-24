import 'package:flutter/material.dart';

class BossTost {
  static getTost({required BuildContext context, required String title ,required Color bgColor}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor:bgColor, 
        behavior: SnackBarBehavior.floating,
        content: Text(
      title,
      style: const TextStyle( 
        fontWeight: FontWeight.w600,
        color:Colors.white
      ),
    )));
  }
}
