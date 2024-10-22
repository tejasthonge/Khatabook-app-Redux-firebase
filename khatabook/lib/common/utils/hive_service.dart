



import 'package:hive_flutter/adapters.dart';

class BossHive{ 

  static BossHive? _singleton;

  factory BossHive(){
    _singleton ??= BossHive._internal();
    return _singleton!;
  }

  BossHive._internal();


  Box? offline;

  void init()async{


    Hive.initFlutter();
    await Hive.openBox("offline");
    offline = Hive.box("offline");    
  }


  void saveAuthToken(String authToken){
    offline!.put("authToken", authToken);
  }

  String? getAuthToken(){
    return offline?.get("authToken");
  }
}