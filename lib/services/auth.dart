import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:my_doctor/models/user.dart';

class Auth {
  static Future<String> signIn(String email, String password) async {
    final auth = FirebaseAuth.instance;
    final result =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    return result.user.uid;
  }

  static Future<String> signUp(String email, String password) async {
    final auth = FirebaseAuth.instance;
    final result = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return result.user.uid;
  }

  static Future<void> signOut() async {
    return FirebaseAuth.instance.signOut();
  }

  static Future<FirebaseUser> getCurrentFirebaseUser() async {
    final user = await FirebaseAuth.instance.currentUser();
    return user;
  }

  static Future<bool> checkUserExist(String userId) async {
    try {
      bool exist = false;
      await Firestore.instance.document('users/$userId').get().then((document) {
        exist = document.exists;
      });
      return exist;
    } catch (error) {
      return false;
    }
  }

  static Future<void> addUser(User user) async {
    checkUserExist(user.userId).then((value) {
      if (!value) {
        Firestore.instance
            .document('users/${user.userId}')
            .setData(user.toMap());
      }
    });
  }

  static Stream<User> getUser(String userID) {
    return Firestore.instance
        .collection("users")
        .where("userID", isEqualTo: userID)
        .snapshots()
        .map((QuerySnapshot snapshot) {
      return snapshot.documents.map((document) {
        return User.fromDocument(document);
      }).first;
    });
  }

  static String getExceptionText(Exception error) {
    if (error is PlatformException) {
      return error.message;
    } else {
      return 'Ocorreu um erro desconhecido.';
    }
  }
}
