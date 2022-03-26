import 'package:barberz/controllers/errors/errors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Rxn<User> _firebaseUser = Rxn<User>();

  User? get user => _firebaseUser.value;

  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  void signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      Get.back();
    } catch (e) {
      if (e is FirebaseAuthException) {
        print(e.message);
        print(password);
        Get.snackbar('Erro', Errors.firebaseErrors[e.code]!,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    }
  }

  void login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on Exception catch (e) {
      if (e is FirebaseAuthException) {
        print(e.message);
        Get.snackbar('Erro', Errors.firebaseErrors[e.code]!,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    }
  }

  void logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      Get.snackbar('Erro', 'LOGAUT??', snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      switch (result.status) {
        case LoginStatus.success:
          final AuthCredential facebookCredential =
              FacebookAuthProvider.credential(result.accessToken!.token);
          final userCredential =
              await _auth.signInWithCredential(facebookCredential);
          break;
        case LoginStatus.cancelled:
          break;
        case LoginStatus.failed:
          Get.snackbar('Erro', 'Ocorreu uma falha no login! Tente outra vez',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white);
          break;
        default:
          return null;
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Erro', Errors.firebaseErrors[e.code]!,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }
}
