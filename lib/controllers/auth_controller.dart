import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genotechies_app/controllers/scaffold_messanger_controller.dart';
import 'package:genotechies_app/views/home/home_view.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController {
  final firebase = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final ScaffoldMessageController scaffoldMessageController =
      ScaffoldMessageController();
  //signin in with email and password
  Future<void> siginWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      navigateToHome(context);
    } catch (e) {
      debugPrint("Sign in failed $e");
      scaffoldMessageController.showSnackBar(
          "Sigin in failed, Please try again", context);
      return;
    }
  }

  //sign in with google
  Future<void> siginWithGoogle(BuildContext context) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        await auth.signInWithCredential(credential);
        navigateToHome(context);
      }
    } catch (e) {
      debugPrint("Sign in with google failed $e");
      scaffoldMessageController.showSnackBar(
          "Sigin in failed, Please try again", context);
      return;
    }
  }

  //register with email and password
  Future<void> registerWithEmailAndPassword(
      String email, String password, String name, BuildContext context) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (auth.currentUser != null) {
        await firebase
            .collection("users")
            .doc()
            .set({"uid": auth.currentUser!.uid, "name": name});
        navigateToHome(context);
      }
    } catch (e) {
      debugPrint("Register failed $e");
      scaffoldMessageController.showSnackBar(
          "Register failed, Please try again", context);
      return;
    }
  }

  void navigateToHome(BuildContext context) => Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => const HomeView()));
}
