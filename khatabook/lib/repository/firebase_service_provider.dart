import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  Future<String?> createEmailAccout(
      {required String email,
      required String password,
      required String name}) async {
    String? status;
    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (user.user != null) {
        String authToken = user.user!.uid;

        UserModel userData =
            UserModel(email: email, name: name, password: password);
        status = await storeUserData(userData: userData, authToken: authToken);
      }

      return status;
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  Future<String?> storeUserData(
      {required String authToken, required UserModel userData}) async {
    try {
      DocumentReference doc =
          await _firestore.collection("user").doc(authToken);
      doc.set(userData.toJson());
      return "User Account Created successfully";
    } on FirebaseException catch (e) {
      return e.code;
    }
  }
}
