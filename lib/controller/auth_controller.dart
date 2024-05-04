import 'package:Comm_type/constant/dimensions.dart';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../main.dart';

class AuthController extends GetxController {
  RxString? _errorCode;
  RxString? get errorCode => _errorCode;
  final RxBool _hasError = false.obs;
  RxBool? get hasError => _hasError;

  Future googleLogin(BuildContext context) async {
    final googleSignIn = GoogleSignIn();
    if (ConnectivityResult.none == await Connectivity().checkConnectivity()) {
      Get.closeAllSnackbars();
      Get.snackbar("Attention", "Please Turn On Your Internet",
          icon: Icon(
            Icons.dangerous_rounded,
            size: Dimensions.iconSize16 * 2,
          ),
          titleText: Text(
            "Attention",
            style: TextStyle(
                fontSize: Dimensions.font20,
                fontWeight: FontWeight.bold,
                fontFamily: 'assets/fonts/SourceSansPro-Bold'),
          ),
          messageText: Text(
            "Please Turn On Your Internet",
            style: TextStyle(fontSize: Dimensions.font16),
          ),
          backgroundColor: Colors.red,
          backgroundGradient: const LinearGradient(
              colors: [Color(0xffED6F9E), Color(0xffEC8B6A)]));

      return;
    }
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: ((context) =>
            const Center(child: CircularProgressIndicator())));
    GoogleSignInAccount? googleUser;
    GoogleSignInAuthentication? googleAuth;
    try {
      googleUser = await googleSignIn.signIn();
    } catch (e) {
      print(e.toString());
    }
    if (googleUser == null) {
      Get.back();
      return;
    } else if (!googleUser.email.contains("@charusat")) {
      await GoogleSignIn().signOut();
      Get.back();
      Get.closeAllSnackbars();
      Get.snackbar("Attention", "Login With Your Charusat University ID only",
          icon: Icon(
            Icons.dangerous_rounded,
            size: Dimensions.iconSize16 * 2,
          ),
          titleText: Text(
            "Attention",
            style: TextStyle(
                fontSize: Dimensions.font20,
                fontWeight: FontWeight.bold,
                fontFamily: 'assets/fonts/SourceSansPro-Bold'),
          ),
          messageText: Text(
            "Login with your university ID only",
            style: TextStyle(fontSize: Dimensions.font16),
          ),
          backgroundColor: Colors.red,
          backgroundGradient: const LinearGradient(
              colors: [Color(0xffED6F9E), Color(0xffEC8B6A)]));

      return;
    }
    try {
      googleAuth = await googleUser.authentication;
    } catch (e) {
      print(e.toString());
    }
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth!.accessToken,
      idToken: googleAuth.idToken,
    );
    try {
      final User userDetails =
          (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
      print(userDetails.displayName);
      print(userDetails.email);

      update();
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "account-exists-with-different-credential":
          _errorCode!(
              "You already have an account with us. Use correct provider");
          _hasError(true);
          break;
        case "null":
          _errorCode!("Some unexpected error while trying to sign in");
          _hasError(true);

          break;
        default:
          _errorCode!(e.toString());
          _hasError(true);
      }
    }

    navigatorKey.currentState!.pop();
  }

  // signout
  Future userSignOut() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }
}
