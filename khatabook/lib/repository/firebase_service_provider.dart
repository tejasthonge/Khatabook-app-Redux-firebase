import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:khatabook/models/session_model.dart';
import 'package:khatabook/models/user_model.dart';

class BossFirebase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static BossFirebase? _singleton;

  factory BossFirebase() {
    _singleton = _singleton ?? BossFirebase._internal();
    return _singleton!;
  }
  BossFirebase._internal();

  Future<BossModel> createEmailAccout(
      {required String email,
      required String password,
      required String name}) async {
    String? status;
    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      String? authToken;
      if (user.user != null) {
        authToken = user.user!.uid;

        UserModel userData =
            UserModel(email: email, name: name, password: password);
        status = await _storeUserData(userData: userData, authToken: authToken);
      }

      return BossModel(lable: status, value: authToken);
    } on FirebaseAuthException catch (e) {
      return BossModel(lable: e.message, value: "");
    }
  }

  Future<String?> _storeUserData(
      {required String authToken, required UserModel userData}) async {
    try {
      DocumentReference doc =
          await _firestore.collection("user").doc(authToken);
      doc.set(userData.toJson());

      return "User created successfully";
    } on FirebaseException catch (e) {
      return e.code;
    }
  }
}
