
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khatabook/common/themes/app_them.dart';
import 'package:khatabook/redux/store.dart';
import 'package:khatabook/view/ui/auth/register.dart';

void main()async{ 
  
  WidgetsBinding _binding =  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding:_binding );

  await Firebase.initializeApp();

  runApp(const MyApp());
  FlutterNativeSplash.remove();

}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp( 
        theme: AppTheme.appTheme,
        home: RegisterPage()
      ),
    );
  }
}